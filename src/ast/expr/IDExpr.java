package ast.expr;

import utils.Position;

public class IDExpr extends Expr {
    public String name;
    public IDExpr(String _s, Position _p) {
        name = _s;
        pos = _p;
    }
    public Position getpos() {
        return pos;
    }
}