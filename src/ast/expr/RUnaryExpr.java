package ast.expr;

import ast.type.IntType;
import ast.type.Type;
import utils.CompileError;
import utils.Position;

public class RUnaryExpr extends Expr {
    public Expr expr;
    public String op;
    public Type type;
    public RUnaryExpr(Expr _e, String _op, Position _pos) {
        expr = _e;
        op = _op;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        if (type != null) return type;
        if (!(expr.gettype() instanceof IntType) || expr instanceof RUnaryExpr)
            throw new CompileError("Type Error(RUnaryExpr)", pos);
        return expr.gettype();
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        if (type == null) type = gettype();
        System.out.println(s + "RUnaryExpr:");
        System.out.println(ss + "Op: " + op);
        System.out.println(ss + "Expr:");
        expr.output(dep + 1);
        System.out.println(ss + "Type:" + type.typename());
        System.out.println(s + "EndRUnaryExpr:");
    }
}