package ast.expr;

import utils.Position;

public class RUnaryExpr extends Expr {
    public Expr expr;
    public String op;
    public RUnaryExpr(Expr _e, String _op, Position _pos) {
        expr = _e;
        op = _op;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }
}