package ast.stmt;

import ast.expr.Expr;
import utils.Position;

public class WhileStmt extends Stmt {
    public Expr expr;
    public Stmt stmt;
    public WhileStmt(Position _pos) {pos = _pos;}
    public WhileStmt(Expr _e, Stmt _s, Position _pos) {
        expr = _e;
        stmt = _s;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }
}