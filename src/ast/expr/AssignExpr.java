package ast.expr;

import utils.Position;

public class AssignExpr extends Expr {
    public Expr expr1, expr2;
    public AssignExpr(Expr _e1, Expr _e2, Position _pos) {
        expr1 = _e1;
        expr2 = _e2;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }
}