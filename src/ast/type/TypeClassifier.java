package ast.type;

import parser.MxstarParser;
import utils.Position;

public class TypeClassifier {
    private Type output = null;
    public Type Classify(MxstarParser.TypeContext ctx){
        // System.err.print(ctx.type().getText());
        String tmp = ctx.baseType().getText();
        if ("int".equals(tmp)) {
            output = new IntType(new Position(ctx.getStart()));
        } else if ("string".equals(tmp)) {
            output = new StringType(new Position(ctx.getStart()));
        } else if ("bool".equals(tmp)) {
            output = new BoolType(new Position(ctx.getStart()));
        } else if ("void".equals(tmp)) {
            output = new VoidType(new Position(ctx.getStart()));
        } else {
            String name = ctx.baseType().Identifier().getText();
            Position pos = new Position(ctx.getStart());
            //GlobalClass.st.print();
            output = new ClassType(name, pos);

        }
        if (ctx.brackets().getText().equals("")) return output;
        int k = ctx.brackets().getText().length() / 2;
        output = new ArrayType(k, output, new Position(ctx.getStart()));
        return output;
    }
    public Type Classify(MxstarParser.BaseTypeContext ctx){
        // System.err.print(ctx.type().getText());
        String tmp = ctx.getText();
        if ("int".equals(tmp)) {
            output = new IntType(new Position(ctx.getStart()));

        } else if ("string".equals(tmp)) {
            output = new StringType(new Position(ctx.getStart()));

        } else if ("bool".equals(tmp)) {
            output = new BoolType(new Position(ctx.getStart()));

        } else if ("void".equals(tmp)) {
            output = new VoidType(new Position(ctx.getStart()));

        } else {
            String name = ctx.Identifier().getText();
            Position pos = new Position(ctx.getStart());
            output = new ClassType(name, pos);

        }
        return output;
    }
}
