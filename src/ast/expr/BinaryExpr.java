package ast.expr;

import utils.Position;

public class BinaryExpr extends Expr {
    public Expr expr1, expr2;
    public String op;
    public BinaryExpr(Expr _e1, Expr _e2, String _op, Position _pos) {
        expr1 = _e1;
        expr2 = _e2;
        op = _op;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }
}