package compiler;

import ast.Root;
import ast.definition.ClassDef;
import ast.definition.Def;
import ast.definition.FuncDef;
import ast.definition.VarDef;
import ast.expr.*;
import ast.stmt.*;
import ast.type.*;
import ir.Func;
import ir.Ir;
import ir.inst.*;
import ir.operand.INum;
import ir.operand.Operand;
import ir.operand.addr.MemAddr;
import ir.operand.reg.Reg;
import ir.operand.reg.VirtualReg;
import ir.operand.reg.X86Reg;
import utils.CompileError;
import utils.Pair;
import utils.Position;

import java.util.ArrayList;
import java.util.List;

public class IrBuilder {
    public Ir root = new Ir();
    public Func nowfunc = null;
    public List<VarDef> vdExpr;
    public Label breakLabel, contLabel, returnLabel;

    public Ir visit(Root x) {
        for (Def d : x.deflist) {
            if (d instanceof ClassDef) {
                int tmp = 0;
                for (Def t : ((ClassDef) d).Deflist) if (t instanceof VarDef){
                    ((VarDef) t).inClass = true;
                    ((VarDef) t).offset = tmp;
                    tmp += 8;
                }
                ((ClassDef) d).size = tmp;
            } else if (d instanceof VarDef){
                ((VarDef) d).isGlobal = true;
                ((VarDef) d).addr = root.add((VarDef) d);
                if (((VarDef) d).expr != null) {
                    vdExpr.add((VarDef) d);
                }
            } else if (d instanceof FuncDef){
                visit((FuncDef) d);
            }
        }
        return root;
    }

    public void visit(Expr x) {x.accept(this);}
    public void visit(Stmt x) {x.accept(this);}

    public void visit(FuncDef x) {
        returnLabel = new Label();
        x.label = new Label(x.name);
        nowfunc = new Func(x.name);
        root.add(nowfunc);
        for (int i = 0; i < x.paramList.size(); ++i) {
            VarDef t = x.paramList.get(i);
            if (i < 6) {
                visit(t);
                nowfunc.addInst(new Move(t.addr, X86Reg.getparam(i)));
            } else t.addr = new MemAddr(X86Reg.rbp, null, 0, 16 + (i - 6) * 8);
        }
        x.stmts.forEach(xx -> visit(xx));
        nowfunc.addInst(returnLabel);
    }

    public void visit(VarDef x) {
        if (x.expr != null) visit(x.expr);
        if (!x.isGlobal) x.addr = nowfunc.newReg();
        if (x.expr != null) nowfunc.addInst(new Move(x.addr, x.expr.operand));
    }

    public VirtualReg getReg(Operand x) {
        if (x instanceof Reg) return (VirtualReg)x;
        else {
            VirtualReg t = nowfunc.newReg();
            nowfunc.addInst(new Move(t, x));
            return t;
        }
    }

    public void visit(ArrayExpr x) {
        visit(x.Leftexpr);
        Reg base = getReg(x.Leftexpr.operand);
        for (Expr u : x.exprList) {
            visit(u);
            Reg ind = getReg(u.operand);
            MemAddr tmp = new MemAddr(base, ind, 8, 0);
            x.MemList.add(tmp);
            base = getReg(tmp);
            x.operand = tmp;
            //base = new MemAddr(base, ind, 8, 0);
        }
    }

    public void visit(AssignExpr x) {
        visit(x.expr1);
        visit(x.expr2);
        nowfunc.addInst(new Move(x.expr1.operand, x.expr2.operand));
    }

    public void visit(BinaryExpr x) {
        visit(x.expr1);
        if (x.op.equals("||")) {
            Label okLabel = new Label(), toLabel = new Label();
            nowfunc.addInst(new CJump(x.expr1.operand, new INum(1), "je", okLabel));
            visit(x.expr2);
            nowfunc.addInst(new Move(x.operand, x.expr2.operand));
            nowfunc.addInst(new Jump(toLabel));
            nowfunc.addInst(okLabel);
            nowfunc.addInst(new Move(x.operand, new INum(1)));
            nowfunc.addInst(toLabel);
            return;
        }
        if (x.op.equals("&&")) {
            Label failLabel = new Label(), toLabel = new Label();
            nowfunc.addInst(new CJump(x.expr1.operand, new INum(1), "je", failLabel));
            nowfunc.addInst(new Move(x.operand, new INum(0)));
            nowfunc.addInst(toLabel);

            visit(x.expr2);
            nowfunc.addInst(new Move(x.operand, x.expr2.operand));

            //nowfunc.addInst(new Jump(toLabel));
            //nowfunc.addInst(okLabel);
            //nowfunc.addInst(new Move(x.operand, new INum(1)));
            nowfunc.addInst(toLabel);
            return;
        }
        visit(x.expr2);
        nowfunc.addInst(new Binop(x.operand, x.op, x.expr1.operand, x.expr2.operand));
    }

    public void visit(ConstExpr x) {
        Type t = x.type;
        if (t instanceof NullType) x.operand = new INum(0);
        if (t instanceof BoolType)
            x.operand = new INum(((BoolType) t).data ? 1 : 0);
        if (t instanceof IntType)
            x.operand = new INum(((IntType) t).data);
        if (t instanceof StringType)
            x.operand = root.add(((StringType) t).data);
    }

    public void visit(FuncExpr x) {
        List<Operand> params = new ArrayList<>();
        for (Expr e : x.exprList) {
            visit(e);
            params.add(e.operand);
        }
        x.operand = nowfunc.newReg();
        Call call = new Call(x.name, params, x.operand);
        nowfunc.addInst(call);
    }
    public void visit(IDExpr x) {
        x.operand = x.varDef.addr;
    }

    public void visit(LUnaryExpr x) {
        visit(x.expr);
        if (x.op.equals("--")) {
            x.operand = x.expr.operand;
            nowfunc.addInst(new Binop(x.operand, "-", x.operand, new INum(1)));
        } else if (x.op.equals("++")) {
            x.operand = x.expr.operand;
            nowfunc.addInst(new Binop(x.operand, "+", x.operand, new INum(1)));
        } else {
            x.operand = nowfunc.newReg();
            nowfunc.addInst(new Move(x.operand, x.expr.operand));
            nowfunc.addInst(new UnaryOp(x.operand, x.op));
        }
    }


    public void visit(MemberExpr x) {
        visit(x.who);
        Reg base = getReg(x.who.operand);
        x.operand = new MemAddr(base, null, 0, x.varDef.offset);
    }

    public void visit(MemberFuncExpr x) {
        List<Operand> params = new ArrayList<>();
        for (Expr e : x.exprList) {
            visit(e);
            params.add(e.operand);
        }
        x.operand = nowfunc.newReg();
        Call call = new Call(x.funcDef.name, params, x.operand);
        nowfunc.addInst(call);
    }

    public void visit(RUnaryExpr x) {
        visit(x.expr);
        x.operand = nowfunc.newReg();
        nowfunc.addInst(new Move(x.operand, x.expr.operand));
        if (x.op.equals("--")) {
            x.operand = x.expr.operand;
            nowfunc.addInst(new Binop(x.expr.operand, "-", x.expr.operand, new INum(1)));
        } else if (x.op.equals("++")) {
            x.operand = x.expr.operand;
            nowfunc.addInst(new Binop(x.expr.operand, "+", x.expr.operand, new INum(1)));
        }
    }

    public Operand buildClass(Type x) {
        VirtualReg dest = nowfunc.newReg();
        if (x instanceof ClassType) {
            Operand tmp = new INum(((ClassType) x).classDef.size);
            ArrayList<Operand> tt = new ArrayList<>();
            tt.add(tmp);
            nowfunc.addInst(
                    new Call(
                            "malloc",
                            tt,
                            dest)
            );
            if (((ClassType) x).classDef.conFunc != null) {
                String name = ((ClassType) x).classDef.conFunc.name;
                tt.clear();
                tt.add(dest);
                nowfunc.addInst(
                        new Call(
                                name,
                                tt,
                                new MemAddr(dest, null, 0, 0)
                        )
                );
            }
        } else throw new CompileError("Can't new this type", new Position(-1, -1));
        return dest;
    }

    public Operand buildArray(NewExpr x, int y) {
        visit(x.exprList.get(y));
        VirtualReg size = nowfunc.newReg();
        VirtualReg dest = nowfunc.newReg();
        nowfunc.addInst(new Move(size, x.exprList.get(y).operand));
        nowfunc.addInst(new Binop(size, "+", size, new INum(1)));
        nowfunc.addInst(new Binop(size, "*", size, new INum(8)));
        ArrayList<Operand> tmpa = new ArrayList<>();
        tmpa.add(size);
        nowfunc.addInst(new Call("malloc", tmpa, dest));
        nowfunc.addInst(new Move(new MemAddr(dest, null, 0, 0), x.exprList.get(y).operand));
        nowfunc.addInst(new Binop(dest, "+", dest, new INum(8)));
        int tmp = 0;
        if (x.d2 == 0 && x.type instanceof ClassType && y + 1 == x.d1) tmp = 1;
        if (y + 1 < x.d1) tmp = 2;
        if (tmp > 0) {
            nowfunc.addInst(new Move(size, x.exprList.get(y).operand));
            Label loop = new Label();
            nowfunc.addInst(loop);
            nowfunc.addInst(new Binop(size, "-", size, new INum(1)));
            Operand tt = (tmp == 1) ? buildClass(x.type) : buildArray(x, y + 1);
            nowfunc.addInst(new Move(new MemAddr(dest, size, 8, 0), tt));
            nowfunc.addInst(new CJump(size, new INum(0), "jne", loop));
        }
        return dest;
    }

    public void visit(NewExpr x) {
        if (x.d1 == 0) x.operand = buildClass(x.type);
        else x.operand = buildArray(x, 0);
    }

    public void visit(BlockStmt x) {x.Stmts.forEach(xx -> visit(xx));}
    public void visit(BreakStmt x) {nowfunc.addInst(new Jump(breakLabel));}
    public void visit(ContStmt x) {nowfunc.addInst(new Jump(contLabel));}
    public void visit(ExprStmt x) {visit(x.expr);}
    public void visit(ForStmt x) {
        Label tc = contLabel, tb = breakLabel;
        contLabel = new Label();
        breakLabel = new Label();
        Label okLabel = new Label(), startLabel = new Label();
        if (!(x.exprs.get(0).gettype() instanceof NullType)) visit(x.exprs.get(0));
        nowfunc.addInst(startLabel);
        if (x.exprs.get(1).gettype() instanceof NullType) {
            nowfunc.addInst(new Jump(okLabel));
        } else {
            visit(x.exprs.get(1));
            nowfunc.addInst(new CJump(x.exprs.get(1).operand, new INum(1), "je", okLabel));
            nowfunc.addInst(new Jump(breakLabel));
        }
        nowfunc.addInst(okLabel);
        visit(x.stmt);
        nowfunc.addInst(contLabel);
        if (!(x.exprs.get(2).gettype() instanceof NullType))
            visit(x.exprs.get(2));
        nowfunc.addInst(new Jump(startLabel));
        nowfunc.addInst(breakLabel);
        contLabel = tc;
        breakLabel = tb;
    }

    public void visit(IfStmt x) {
        Label ed = new Label();
        for (Pair<Expr, Stmt> u: x.ifList) {
            Label okLabel = new Label();
            Label failLabel = new Label();
            visit(u.getFirst());
            nowfunc.addInst(new CJump(u.getFirst().operand, new INum(1), "je", okLabel));
            nowfunc.addInst(new Jump(failLabel));
            nowfunc.addInst(okLabel);
            visit(u.getSecond());
            nowfunc.addInst(new Jump(ed));
            nowfunc.addInst(failLabel);
        }
        if (x.elsestmt != null) visit(x.elsestmt);
        nowfunc.addInst(ed);
    }

    public void visit(ReturnStmt x) {
        if (x.expr != null) {
            visit(x.expr);
            nowfunc.addInst(new Move(X86Reg.rax, x.expr.operand));
        }
        nowfunc.addInst(new Jump(returnLabel));
    }

    public void visit(WhileStmt x) {
        Label tc = contLabel, tb = breakLabel;
        contLabel = new Label();
        breakLabel = new Label();
        Label okLabel = new Label(), startLabel = new Label();
        nowfunc.addInst(startLabel);

        visit(x.expr);
        nowfunc.addInst(new CJump(x.expr.operand, new INum(1), "je", okLabel));
        nowfunc.addInst(new Jump(breakLabel));

        nowfunc.addInst(okLabel);
        visit(x.stmt);
        nowfunc.addInst(contLabel);

        nowfunc.addInst(new Jump(startLabel));
        nowfunc.addInst(breakLabel);
        contLabel = tc;
        breakLabel = tb;
    }
}