package ast.stmt;

import ast.expr.Expr;
import utils.Position;

public class ExprStmt extends Stmt {
    public Expr expr;
    public ExprStmt(Expr _e, Position _p) {
        pos = _p;
        expr = _e;
    }
    public ExprStmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
}