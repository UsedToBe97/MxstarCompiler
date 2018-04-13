package ast.expr;

import utils.Position;

public class LUnaryExpr extends Expr {
    public Expr expr;
    public String op;
    public LUnaryExpr(Expr _e, String _op, Position _pos) {
        expr = _e;
        op = _op;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }
}