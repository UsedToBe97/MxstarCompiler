package ast.stmt;

import ast.expr.Expr;
import utils.Position;

public class ReturnStmt extends Stmt {
    public Expr expr;
    public ReturnStmt(Expr _e, Position _p) {
        pos = _p;
        expr = _e;
    }
    public ReturnStmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
}