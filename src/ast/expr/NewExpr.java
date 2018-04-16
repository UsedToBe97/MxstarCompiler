package ast.expr;

import ast.type.ArrayType;
import ast.type.IntType;
import ast.type.Type;
import ast.type.TypeClassifier;
import parser.MxstarParser;
import utils.CompileError;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class NewExpr extends Expr {
    public Type type;
    public List<Expr> exprList = new LinkedList<>();
    public int d;
    public int d1;
    public int d2;
    public NewExpr(MxstarParser.BaseTypeContext ctx) {
        TypeClassifier tc = new TypeClassifier();
        type = tc.Classify(ctx);
        pos = new Position(ctx.getStart());
    }
    public void add(Expr _e) {exprList.add(_e);}

    public Position getpos() {
        return pos;
    }

    public Type gettype() {
        System.err.println("New!");
        //System.err.println(exprList.get(0));
        for (Expr e : exprList) {
            if (!(e.gettype() instanceof IntType))
                throw new CompileError("Expr Not Int(NewExpr)", pos);
        }
        if (d == 0) return type;
        return new ArrayType(d, type, pos);
    }
}