package ast.expr;

import ast.type.BoolType;
import ast.type.IntType;
import ast.type.StringType;
import ast.type.Type;
import utils.CompileError;
import utils.Position;

import java.util.Objects;

public class BinaryExpr extends Expr {
    public Expr expr1, expr2;
    public String op;
    public BinaryExpr(Expr _e1, Expr _e2, String _op, Position _pos) {
        expr1 = _e1;
        expr2 = _e2;
        op = _op;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }

    public Type gettype() {
        System.err.println("FUCK!!!!!!");
        Type t1 = expr1.gettype(), t2 = expr2.gettype();
        if (op.equals("+")) {
            if (!(t1 instanceof IntType || t1 instanceof StringType))
                throw new CompileError("Type Error(Binary Expr)", pos);
            if (!(t2 instanceof IntType || t2 instanceof StringType))
                throw new CompileError("Type Error(Binary Expr)", pos);
            return t1;
        } else if (op.equals("&&") || op.equals("||")) {
            if (!(t1 instanceof BoolType))
                throw new CompileError("Type Error(Binary Expr)", pos);
            if (!(t2 instanceof BoolType))
                throw new CompileError("Type Error(Binary Expr)", pos);

        } else {
            if (!(t1 instanceof IntType || t2 instanceof IntType))
                throw new CompileError("Type Error(Binary Expr)", pos);
        }
        if (!(Objects.equals(t1.typename(), t2.typename())))
            throw new CompileError("Type Error(Binary Expr)", pos);
        if (op.equals("&&") || op.equals("||") || op.equals(">=") ||
                op.equals("<=") || op.equals("<") || op.equals(">")) return new BoolType(pos);
        if (op.equals("==") || op.equals("!=")) return new BoolType(pos);
        return t1;
    }
}