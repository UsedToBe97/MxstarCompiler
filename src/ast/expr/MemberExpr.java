package ast.expr;

import utils.Position;

public class MemberExpr extends Expr {
    public Expr who;
    public String name;
    public Position getpos() {
        return pos;
    }
    public MemberExpr(Expr _e, String _s, Position _p) {
        who = _e;
        name = _s;
        pos = _p;
    }
}