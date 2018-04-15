package ast.stmt;

import ast.expr.Expr;
import ast.type.BoolType;
import utils.CompileError;
import utils.GlobalClass;
import utils.Pair;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class IfStmt extends Stmt {
    public IfStmt(Position _pos) {pos = _pos;}
    public List<Pair<Expr, Stmt>> ifList = new LinkedList<>();
    public Stmt elsestmt = null;
    public void add(Expr _e, Stmt _s) {ifList.add(new Pair<>(_e, _s));}
    public void addElse(Stmt _s) {elsestmt = _s;}
    public Position getpos() {
        return pos;
    }
    public void check() {
        System.err.println("Check IfStmt");
        for (Pair<Expr, Stmt> u : ifList) {
            System.err.println(u.getFirst().toString());
            System.err.println(u.getFirst().gettype().typename() + " ????? ");
            if (!(u.getFirst().gettype() instanceof BoolType))
                throw new CompileError("Not bool type(If Stmt)", pos);
            if (u.getSecond() != null) {
                GlobalClass.st.enterScope();
                u.getSecond().check();
                GlobalClass.st.exitScope();
            }
        }
        if (elsestmt != null) {
            GlobalClass.st.enterScope();
            elsestmt.check();
            GlobalClass.st.exitScope();
        }
    }
}