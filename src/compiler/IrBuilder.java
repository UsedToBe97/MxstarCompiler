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
import utils.GlobalClass;
import utils.Pair;
import utils.Position;

import java.util.*;

public class IrBuilder {
    public Ir root = new Ir();
    public Func nowfunc = null;
    public List<VarDef> vdExpr = new LinkedList<>();
    public Label breakLabel, contLabel, returnLabel;
    public String nowclass = "";
    public Operand baseaddr, ii;
    public Map<String, VarDef> varMap = new HashMap<>();

    public Ir visit(Root x) {
        for (Def d : x.deflist) {
            if (d instanceof ClassDef) {
                int tmp = 0;
                nowclass = ((ClassDef) d).name;
                for (Def t : ((ClassDef) d).Deflist)
                    if (t instanceof VarDef) {
                        ((VarDef) t).inClass = true;
                        ((VarDef) t).offset = tmp;
                        varMap.put(nowclass + "." + ((VarDef) t).name, (VarDef) t);
                        tmp += 8;
                    } else if (t instanceof FuncDef) {
                        //visit2((FuncDef) t);
                    }
                ((ClassDef) d).size = tmp;
            } else if (d instanceof VarDef) {
                nowclass = "";
                ((VarDef) d).isGlobal = true;
                ((VarDef) d).addr = root.add((VarDef) d);
                if (((VarDef) d).expr != null) {
                    vdExpr.add((VarDef) d);
                }
            }
        }
        for (Def d : x.deflist)
            if (d instanceof FuncDef) {
                nowclass = "";
                visit((FuncDef) d);
            }
        for (Func u : root.Funcs) doit(u);
        return root;
    }

    public void visit(Expr x) {
        if (x != null) x.accept(this);
    }

    public void visit(Stmt x) {
        if (x != null) x.accept(this);
    }

    public void visit(FuncDef x) {
        returnLabel = new Label();
        x.label = new Label(x.name);
        nowfunc = new Func(x.name);
        root.add(nowfunc);
        if (x.paramList.size() > 0 && x.params.get(0).getFirst() instanceof ClassType)
            nowclass = ((ClassType) x.params.get(0).getFirst()).name;
        for (int i = 0; i < x.paramList.size(); ++i) {
            Def t = x.paramList.get(i);
            if (i < 6) {
                visit(t);
                if (i == 0) baseaddr = t.addr;
                nowfunc.addInst(new Move(t.addr, X86Reg.getparam(i)));
            } else t.addr = new MemAddr(X86Reg.rbp, null, 0, 16 + (i - 6) * 8);
        }
        for (int i = 0; i < x.paramList.size(); ++i) {
            Def t = x.paramList.get(i);
            nowfunc.defMap.put(t.getname(), t.addr);
        }
        if (x.name.equals("main"))
            for (VarDef u : vdExpr) visit(u);
        x.stmts.forEach(xx -> visit(xx));
        nowfunc.addInst(returnLabel);
        nowclass = "";
    }
    /*public void visit2(FuncDef x) {
        returnLabel = new Label();
        x.label = new Label(x.name);
        nowfunc = new Func(x.name);
        root.add(nowfunc);

        if (!x.name.contains("."))
            throw new CompileError("where is .", new Position(-1, -1));
        VirtualReg tmp = nowfunc.newReg();
        nowfunc.addInst(new Move(tmp, X86Reg.getparam(0)));
        for (int i = 0; i < x.paramList.size(); ++i) {
            VarDef t = x.paramList.get(i);
            if (i + 1 < 6) {
                visit(t);
                nowfunc.addInst(new Move(t.addr, X86Reg.getparam(i + 1)));
            } else t.addr = new MemAddr(X86Reg.rbp, null, 0, 16 + (i + 1 - 6) * 8);
        }
        x.stmts.forEach(xx -> visit(xx));
        nowfunc.addInst(returnLabel);
    }*/

    public void visit(VarDef x) {
        if (x.expr != null) visit(x.expr);
        if (!x.isGlobal) {
            x.addr = nowfunc.newReg();
            nowfunc.defMap.put(x.name, x.addr);
        }
        if (x.expr != null) nowfunc.addInst(new Move(x.addr, x.expr.operand));
    }

    public VirtualReg getReg(Operand x) {
        if (x instanceof Reg) return (VirtualReg) x;
        else {
            VirtualReg t = nowfunc.newReg();
            nowfunc.addInst(new Move(t, x));
            return t;
        }
    }

    public void visit(ArrayExpr x) {
        visit(x.Leftexpr);
        Reg base = getReg(x.Leftexpr.operand);
        int cnt = 0;
        for (Expr u : x.exprList) {
            visit(u);
            Reg ind = getReg(u.operand);
            MemAddr tmp = new MemAddr(base, ind, 8, 0);
            x.MemList.add(tmp);
            if (++cnt != x.exprList.size()) base = getReg(tmp);
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
        x.operand = nowfunc.newReg();
        if (x.op.equals("+") && x.expr1.gettype() instanceof StringType && x.expr2.gettype() instanceof StringType) {
            x.operand = nowfunc.newReg();
            List<Operand> params = new ArrayList<>();
            visit(x.expr1);
            visit(x.expr2);
            params.add(x.expr1.operand);
            params.add(x.expr2.operand);
            Call call = new Call("string.add", params, x.operand);
            nowfunc.addInst(call);
            return;
        }
        if (x.op.equals("==") && x.expr1.gettype() instanceof StringType && x.expr2.gettype() instanceof StringType) {
            x.operand = nowfunc.newReg();
            List<Operand> params = new ArrayList<>();
            visit(x.expr1);
            visit(x.expr2);
            params.add(x.expr1.operand);
            params.add(x.expr2.operand);
            Call call = new Call("string.eq", params, x.operand);
            nowfunc.addInst(call);
            return;
        }
        if (x.op.equals("<") && x.expr1.gettype() instanceof StringType && x.expr2.gettype() instanceof StringType) {
            x.operand = nowfunc.newReg();
            List<Operand> params = new ArrayList<>();
            visit(x.expr1);
            visit(x.expr2);
            params.add(x.expr1.operand);
            params.add(x.expr2.operand);
            Call call = new Call("string.s", params, x.operand);
            nowfunc.addInst(call);
            return;
        }
        if (x.op.equals(">") && x.expr1.gettype() instanceof StringType && x.expr2.gettype() instanceof StringType) {
            x.operand = nowfunc.newReg();
            List<Operand> params = new ArrayList<>();
            visit(x.expr1);
            visit(x.expr2);
            params.add(x.expr1.operand);
            params.add(x.expr2.operand);
            Call call = new Call("string.g", params, x.operand);
            nowfunc.addInst(call);
            return;
        }
        if (x.op.equals(">=") && x.expr1.gettype() instanceof StringType && x.expr2.gettype() instanceof StringType) {
            x.operand = nowfunc.newReg();
            List<Operand> params = new ArrayList<>();
            visit(x.expr1);
            visit(x.expr2);
            params.add(x.expr1.operand);
            params.add(x.expr2.operand);
            Call call = new Call("string.ge", params, x.operand);
            nowfunc.addInst(call);
            return;
        }
        if (x.op.equals("<=") && x.expr1.gettype() instanceof StringType && x.expr2.gettype() instanceof StringType) {
            x.operand = nowfunc.newReg();
            List<Operand> params = new ArrayList<>();
            visit(x.expr1);
            visit(x.expr2);
            params.add(x.expr1.operand);
            params.add(x.expr2.operand);
            Call call = new Call("string.le", params, x.operand);
            nowfunc.addInst(call);
            return;
        }
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
            Label okLabel = new Label(), toLabel = new Label();
            nowfunc.addInst(new CJump(x.expr1.operand, new INum(1), "je", okLabel));
            nowfunc.addInst(new Move(x.operand, new INum(0)));
            nowfunc.addInst(new Jump(toLabel));
            nowfunc.addInst(okLabel);
            visit(x.expr2);
            nowfunc.addInst(new Move(x.operand, x.expr2.operand));

            //nowfunc.addInst(new Jump(toLabel));
            //nowfunc.addInst(okLabel);
            //nowfunc.addInst(new Move(x.operand, new INum(1)));
            nowfunc.addInst(toLabel);
            return;
        }
        visit(x.expr2);
        if (x.expr1.operand instanceof INum && x.expr2.operand instanceof INum) {
            int l = ((INum) x.expr1.operand).v;
            int r = ((INum) x.expr2.operand).v;
            int v;
            switch (x.op) {
                case "+": v = (l + r);break;
                case "-": v = (l - r);break;
                case "*": v = (l * r);break;
                case "/": v = (l / r);break;
                case "%": v = (l % r);break;
                case "<<": v = (l << r);break;
                case ">>": v  = (l >> r);break;
                case "&": v = (l & r);break;
                case "^": v = (l ^ r);break;
                case "|": v = (l | r);break;
                case ">": v = (l >  r ? 1 : 0);break;
                case "<": v = (l <  r ? 1 : 0);break;
                case ">=": v = (l >= r ? 1 : 0);break;
                case "<=": v = (l <= r ? 1 : 0);break;
                case "==": v = (l == r ? 1 : 0);break;
                case "!=": v = (l != r ? 1 : 0);break;
                default: throw new Error();
            }
            x.operand = new INum(v);
            return;
        }
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
        if (x.isMemFunc) {
            //System.err.println(tmp);
            Type t = x.exprList.get(0).gettype();
            if (t instanceof ClassType) {
                x.name = ((ClassType) t).name + "." + x.name;
            } else if (t instanceof StringType) {
                x.name = "string." + x.name;
            } else if (t instanceof ArrayType) {
                x.name = "array." + x.name;
            }
        } else if (x.exprList.size() > 0 && x.exprList.get(0) instanceof IDExpr) {
            if (((IDExpr) x.exprList.get(0)).name.equals("this")) {
                x.name = nowclass + "." + x.name;
            }
        }
        for (Expr e : x.exprList) {
            visit(e);
            params.add(e.operand);
        }
        if (nowfunc.num < 524 && x.funcDef.inline == true) {
            if (!x.isMemFunc && x.funcDef.stmts.size() == 1 && x.funcDef.stmts.get(0) instanceof ReturnStmt) {
                x.funcDef.inline = false;
                Expr res = ((ReturnStmt) x.funcDef.stmts.get(0)).expr;
                HashMap<String, Operand> newMap = new HashMap<>();
                for(int i = 0; i < x.funcDef.params.size(); ++i) {
                    VarDef A = (VarDef) x.funcDef.paramList.get(i);
                    Expr B = x.exprList.get(i);
                    newMap.put(A.name, B.operand);
                }
                Expr tmp = res.getinline(newMap);
                visit(tmp);
                x.operand = tmp.operand;
                x.funcDef.inline = true;
                return;
            }
        }
        if (params.size() == 1 && x.exprList.get(0) instanceof ConstExpr && ((ConstExpr)x.exprList.get(0)).type instanceof IntType && ii != null) {
            x.operand = nowfunc.newReg();
            Label tmp = new Label();
            nowfunc.addInst(new CJump(ii, new INum(0), "jne", tmp));
            Call call = new Call(x.name, params, x.operand);
            nowfunc.addInst(call);
            nowfunc.addInst(tmp);
            return;
        }
        x.operand = nowfunc.newReg();
        Call call = new Call(x.name, params, x.operand);
        nowfunc.addInst(call);
    }

    public void visit(IDExpr x) {
        if (x.varDef != null && x.varDef.addr != null) x.operand = x.varDef.addr;
        else if (nowfunc.defMap.containsKey(x.name)) {
            x.operand = nowfunc.defMap.get(x.name);
        } else {
            VarDef vd = varMap.get(nowclass + "." + x.name);
            Reg base = getReg(baseaddr);
            if (x.name.equals("this")) x.operand = base;
            else x.operand = new MemAddr(base, null, 0, vd.offset);
        }
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

    /*public void visit(MemberFuncExpr x) {
        throw new CompileError("Ridiculous", new Position(-1, -1));
        List<Operand> params = new ArrayList<>();
        if (x.who.operand == null) visit(x.who);
        params.add(x.who.operand);
        for (Expr e : x.exprList) {
            visit(e);
            params.add(e.operand);
        }
        x.operand = nowfunc.newReg();
        Call call = new Call(x.funcDef.name, params, x.operand);
        nowfunc.addInst(call);
    }*/

    public void visit(RUnaryExpr x) {
        visit(x.expr);
        x.operand = nowfunc.newReg();
        nowfunc.addInst(new Move(x.operand, x.expr.operand));
        if (x.op.equals("--")) {
            //x.operand = x.expr.operand;
            nowfunc.addInst(new Binop(x.expr.operand, "-", x.expr.operand, new INum(1)));
        } else if (x.op.equals("++")) {
            //x.operand = x.expr.operand;
            nowfunc.addInst(new Binop(x.expr.operand, "+", x.expr.operand, new INum(1)));
        }
    }

    public Operand buildClass(Type x) {
        VirtualReg dest = nowfunc.newReg();
        if (x instanceof ClassType) {
            if (((ClassType) x).classDef == null)
                ((ClassType) x).classDef = (ClassDef) GlobalClass.st.now.check(((ClassType) x).name);
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
                                null
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

    public void visit(BlockStmt x) {
        x.Stmts.forEach(xx -> visit(xx));
    }

    public void visit(BreakStmt x) {
        nowfunc.addInst(new Jump(breakLabel));
    }

    public void visit(ContStmt x) {
        nowfunc.addInst(new Jump(contLabel));
    }

    public void visit(ExprStmt x) {
        visit(x.expr);
    }

    public void visit(ForStmt x) {
        if (x.del) return;
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
            if (x.exprs.get(1) instanceof BinaryExpr) {
                ii = ((BinaryExpr) x.exprs.get(1)).expr1.operand;
            }
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
        ii = null;
    }

    public void visit(IfStmt x) {
        Label ed = new Label();
        for (Pair<Expr, Stmt> u : x.ifList) {
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

    public void doit(Func x) {
        List<Inst> tmp = new ArrayList<>();
        Set<Label> used = new HashSet<>();
        HashMap<Label, Label> map = new HashMap<>();
        for (Inst u : x.Insts) {
            if (u instanceof Label) map.put((Label) u, (Label) u);
            if (u instanceof Jump) used.add(((Jump) u).label);
            if (u instanceof CJump) used.add(((CJump) u).dest);
        }
        Inst pre = null;
        for (int i = 0; i < x.Insts.size(); ++i) {
            Inst u = x.Insts.get(i);
            if (u instanceof Label && !used.contains(u)) continue;
            if (pre instanceof Jump) if (!(u instanceof Label)) continue;
            if (pre instanceof Label && u instanceof Label) {
                map.put((Label) u, (Label)pre);
                continue;
            }
            if (pre != null) tmp.add(pre);
            pre = u;
        }
        if (pre != null) tmp.add(pre);
        for (Inst u : tmp) {
            if (u instanceof Jump) {
                Label t = ((Jump) u).label;
                for (Label nxt = map.get(t); nxt != t; t = nxt, nxt = map.get(t));
                ((Jump) u).label = t;
            }
            if (u instanceof CJump) {
                Label t = ((CJump) u).dest;
                for (Label nxt = map.get(t); nxt != t; t = nxt, nxt = map.get(t));
                ((CJump) u).dest = t;
            }
        }
        x.Insts = tmp;

        tmp = new ArrayList<>();
        for (int i = 1; i < x.Insts.size(); ++i) {
            boolean ok = false;
            if (x.Insts.get(i - 1) instanceof Binop && x.Insts.get(i) instanceof CJump) {
                Binop t1 = (Binop)x.Insts.get(i - 1);
                CJump t2 = (CJump)x.Insts.get(i);
                if (t1.dest == t2.lhs && t2.rhs instanceof INum) {
                    if (((INum)t2.rhs).v == 1) {
                        String op = "";
                        switch (t1.op) {
                            case ">" : op = "jg"; break;
                            case "<" : op = "jl"; break;
                            case "==": op = "je"; break;
                            case "!=": op = "jne"; break;
                            case ">=": op = "jge"; break;
                            case "<=": op = "jle"; break;
                        }
                        if (!op.equals("")) {
                            ok = true;
                            ++i;
                            tmp.add(new CJump(t1.lhs, t1.rhs, op, t2.dest));
                        }
                    }
                }
            }
            if (ok) continue;
            tmp.add(x.Insts.get(i - 1));
            if (i == x.Insts.size() - 1) tmp.add(x.Insts.get(i));
        }
        x.Insts = tmp;
    }
}
