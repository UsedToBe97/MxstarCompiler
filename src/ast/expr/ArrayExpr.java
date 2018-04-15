package ast.expr;

import ast.type.ArrayType;
import ast.type.IntType;
import ast.type.Type;
import utils.CompileError;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class ArrayExpr extends Expr {
    public Expr Leftexpr;
    public List<Expr> exprList;
    public ArrayExpr(Expr _e) {
        Leftexpr = _e;
        exprList = new LinkedList<>();
    }
    public void add(Expr _e) {
        exprList.add(_e);
    }
    public Position getpos() {
        return pos;
    }

    public Type gettype() {
        int tmpd = 0;
        for (Expr u : exprList) {
            ++tmpd;
            if (!(u.gettype() instanceof IntType))
                throw new CompileError("Index Error(ArrayExpr)", pos);
        }
        if (Leftexpr.gettype() instanceof ArrayType) {
            int ff = tmpd - ((ArrayType) Leftexpr.gettype()).d;
            if (ff == 0)
                return ((ArrayType) Leftexpr.gettype()).type;
            else if (ff > 0) return new ArrayType(ff, ((ArrayType) Leftexpr.gettype()).type, pos);
            else throw new CompileError("Index Too Many(ArrayExpr)", pos);
        } else throw new CompileError("LeftExpr Error(ArrayExpr)", pos);
    }
}