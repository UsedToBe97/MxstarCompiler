package ast.expr;

import ast.type.Type;

public class ConstExpr extends Expr {
    public Type type;
    public ConstExpr(Type _t){
        type = _t;
        pos = _t.getpos();
    }
    public Type gettype() {
        return type;
    }
}
