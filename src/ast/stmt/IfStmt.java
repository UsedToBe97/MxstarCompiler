package ast.stmt;

import ast.expr.Expr;
import ast.type.BoolType;
import utils.CompileError;
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
            if (!(u.getFirst().gettype() instanceof BoolType))
                throw new CompileError("Not bool type(If Stmt)", pos);
            if (u.getSecond() != null) u.getSecond().check();
        }
        if (elsestmt != null) elsestmt.check();
    }
}