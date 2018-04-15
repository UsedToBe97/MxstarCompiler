package ast.expr;

import ast.type.NullType;
import ast.type.Type;
import utils.CompileError;
import utils.GlobalClass;
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
    public Type gettype() {
        System.err.println("Assign!");
        if (!(expr1 instanceof IDExpr || expr1 instanceof ArrayExpr || expr1 instanceof MemberExpr))
            throw new CompileError("Left Expr Error(AssignExpr)", pos);

        System.err.println(GlobalClass.classname);
        Type t1 = expr1.gettype();
        Type t2 = expr2.gettype();
        System.err.println(t1.typename() + " = " + t2.typename());
        if (!t1.typename().equals(t2.typename()) && !(t2 instanceof NullType))
            throw new CompileError("Type Error(AssignExpr)", pos);
        return t1;
    }

}