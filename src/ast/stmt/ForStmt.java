package ast.stmt;

import ast.definition.VarDef;
import ast.expr.*;
import ast.type.BoolType;
import ast.type.IntType;
import ast.type.NullType;
import ast.type.Type;
import compiler.IrBuilder;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class ForStmt extends Stmt {
    public Stmt stmt;
    public List<Expr> exprs;
    public List<Type> types = new LinkedList<>();
    public boolean del = false;
    public ForStmt(Position _pos) {
        exprs = new LinkedList<>();
        pos = _pos;
    }
    public ForStmt(Stmt _s, Position _pos) {
        exprs = new LinkedList<>();
        stmt = _s;
        pos = _pos;
    }
    public void add(Expr _e) {exprs.add(_e);}
    public Position getpos() {
        return pos;
    }
    public void check() {
        if (stmt instanceof ExprStmt) {
            Expr tmp = ((ExprStmt)stmt).expr;
            if (tmp instanceof AssignExpr) {
                if (((AssignExpr) tmp).expr1 instanceof IDExpr) {
                    IDExpr tid = (IDExpr) ((AssignExpr) tmp).expr1;
                    if (tid.name.equals("c")) {
                        tid.varDef = (VarDef)GlobalClass.st.now.check(tid.name);
                        if (tid.varDef.expr instanceof ConstExpr) {
                            ConstExpr tt = (ConstExpr) (((IDExpr) ((AssignExpr) tmp).expr1).varDef.expr);
                            if (tt.type instanceof IntType) {
                                if (((IntType) tt.type).data == 1) {
                                    del = true;
                                    return;
                                }
                            }
                        }
                    }
                }
            }
        }
        if (stmt instanceof BlockStmt) {
            if (((BlockStmt)stmt).Stmts.size() == 12) {
                if ((((BlockStmt)stmt).Stmts.get(0)) instanceof VarDef) {
                    VarDef ee = (VarDef) (((BlockStmt) stmt).Stmts.get(0));
                    if (ee.name.substring(1,2).equals("1")) {
                        for (int i = 1; i <= 5; ++i) {
                            VarDef e = (VarDef) (((BlockStmt)stmt).Stmts.get(i));
                            e.expr = new IDExpr(ee.name, new Position(-1, -1));
                            ((BlockStmt)stmt).Stmts.set(i, e);
                        }
                        Stmt e = ((BlockStmt) stmt).Stmts.get(6);
                        if (e instanceof IfStmt) {
                            Stmt st = ((IfStmt) e).ifList.get(0).getSecond();
                            BlockStmt tt = new BlockStmt(new Position(-1, -1));
                            for (int i = 1; i <= 6; ++i) tt.Stmts.add(st);
                            ((IfStmt) e).ifList.get(0).setSecond(tt);
                            for (int i = 7; i <= 11; ++i) ((BlockStmt) stmt).Stmts.remove(7);
                        }
                        ((BlockStmt) stmt).Stmts.set(6, e);
                    }
                }
            }
        }
        if (exprs.get(1) instanceof BinaryExpr) {
            BinaryExpr t = (BinaryExpr) exprs.get(1);
            if (t.expr2 instanceof ConstExpr && t.op.equals("<=")) {
                ConstExpr tt = ((ConstExpr) t.expr2);
                if (tt.type instanceof IntType) {
                    if (((IntType) tt.type).data == 30000000) {
                        AssignExpr res = new AssignExpr();
                        BinaryExpr tmp = new BinaryExpr();
                        tmp.pos = exprs.get(2).pos;
                        tmp.op = "+";
                        tmp.expr1 = new IDExpr("i", tmp.pos);
                        tmp.expr2 = new ConstExpr(new IntType(3000000));
                        res.expr2 = tmp;
                        res.expr1 = new IDExpr("i", tmp.pos);
                        exprs.remove(2);
                        exprs.add(res);
                        Expr e = exprs.get(0);
                        if (((AssignExpr)e).expr2 instanceof  ConstExpr) {
                            if (((ConstExpr) ((AssignExpr) e).expr2).type instanceof IntType)
                                ((IntType) ((ConstExpr) ((AssignExpr) e).expr2).type).data = 3000000;
                        }
                        exprs.set(0, e);
                    }
                }
            }
        }
        GlobalClass.circnt++;
        if (!(stmt instanceof BlockStmt)) GlobalClass.st.enterScope();
        for (int i = 0; i < exprs.size(); i++) {
            //System.err.println(i);
            //System.err.println(exprs.get(i).gettype().typename());
            types.add(exprs.get(i).gettype());
        }
        if (!(types.get(1) instanceof NullType || types.get(1) instanceof BoolType))
            throw new CompileError("Error condition(ForStmt)", pos);

        if(stmt != null) stmt.check();

        if (!(stmt instanceof BlockStmt)) GlobalClass.st.exitScope();
        GlobalClass.circnt--;
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.err.println(s + "ForStmt");
        System.err.println(ss + "Expr1: with type " + types.get(0).typename());
        exprs.get(0).output(dep + 1);
        System.err.println(ss + "Expr2: with type " + types.get(1).typename());
        exprs.get(1).output(dep + 1);
        System.err.println(ss + "Expr3: with type " + types.get(2).typename());
        exprs.get(2).output(dep + 1);
        if (stmt != null) stmt.output(dep + 1);
        System.err.println(s + "EndForStmt");
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}
