package ast.stmt;

import ast.expr.Expr;
import utils.Pair;
import utils.Position;

import java.util.List;

public class IfStmt extends Stmt {
    public IfStmt(Position _pos) {pos = _pos;}
    public List<Pair<Expr, Stmt>> ifList;
    public Stmt elsestmt = null;
    public void add(Expr _e, Stmt _s) {ifList.add(new Pair<>(_e, _s));}
    public void addElse(Stmt _s) {elsestmt = _s;}
    public Position getpos() {
        return pos;
    }
}