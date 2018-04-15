package ast.expr;

import ast.type.BoolType;
import ast.type.IntType;
import ast.type.Type;
import utils.CompileError;
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
    public Type gettype() {
        if (op.equals("!") || op.equals('~')) {
            if (!(expr.gettype() instanceof IntType || expr.gettype() instanceof BoolType))
                throw new CompileError("Type Error", pos);
        } else {
            if (!(expr.gettype() instanceof IntType))
                throw new CompileError("Type Error", pos);
        }
        return expr.gettype();
    }
}