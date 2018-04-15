package ast.expr;

import ast.type.Type;
import utils.CompileError;
import utils.Position;

import java.util.Objects;

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
        if (!(expr1 instanceof IDExpr || expr1 instanceof ArrayExpr || expr1 instanceof MemberExpr))
            throw new CompileError("Left Expr Error", pos);
        Type t1 = expr1.gettype(), t2 = expr2.gettype();
        if (!Objects.equals(t1, t2))
            throw new CompileError("Type Error", pos);
        return t1;
    }

}