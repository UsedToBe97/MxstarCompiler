package ast.expr;

import ast.type.BoolType;
import ast.type.IntType;
import ast.type.Type;
import utils.CompileError;
import utils.Position;

public class LUnaryExpr extends Expr {
    public Expr expr;
    public String op;
    public Type type;
    public LUnaryExpr(Expr _e, String _op, Position _pos) {
        expr = _e;
        op = _op;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        System.err.println("LUnary！"+ op);
        if (type != null) return type;
        if (op.equals("!") || op.equals("~")) {
            System.err.println("FUCK");
            if (!(expr.gettype() instanceof IntType || expr.gettype() instanceof BoolType))
                throw new CompileError("Type Error(LUnaryExpr)", pos);
        } else {
            System.err.println(expr.gettype().typename());
            if (!(expr.gettype() instanceof IntType))
                throw new CompileError("Type Error(LUnaryExpr)", pos);
        }
        return type = expr.gettype();
    }

    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "LUnaryExpr:");
        System.out.println(ss + "Op: " + op);
        System.out.println(ss + "Expr:");
        expr.output(dep + 1);
        System.out.println(ss + "Type:" + type.typename());
        System.out.println(s + "EndLUnaryExpr:");
    }
}