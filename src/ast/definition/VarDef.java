package ast.definition;

import ast.expr.Expr;
import ast.type.Type;
import ast.type.TypeClassifier;
import parser.MxstarParser;
import utils.Position;

public class VarDef extends Def {
    public String name;
    public Expr expr;
    public Type type;

    public VarDef(MxstarParser.VarDefContext ctx) {
        pos = new Position(ctx.getStart());
        setName(ctx.Identifier().getText());
        setType(new TypeClassifier().Classify(ctx.type()));
    }

    public VarDef(Position _pos) {pos = _pos;}
    public void setName(String _name) {name = _name;}
    public void setType(Type _type) {type = _type;}
    public void setExpr(Expr _expr) {expr = _expr;}
    public String getName() {return name;}
    public Type getType() {return type;}
    public Position getpos() {return pos;}
    public Expr getExpr() {return expr;}
}