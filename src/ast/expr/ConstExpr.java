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
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "ConstExpr:");
        System.out.println(ss + " Type: " + type.typename());
    }
}
