package ast.definition;

import ast.stmt.Stmt;
import ast.type.Type;
import ast.type.TypeClassifier;
import parser.MxstarParser;
import utils.Pair;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class FuncDef extends Def{
    public String name;
    public Type type;
    public List<Pair<Type, String>> params;
    public List<Stmt> stmts;
    public FuncDef(String _name, Type _type) {
        name = _name;
        type = _type;
        params = new LinkedList<>();
        stmts = new LinkedList<>();
    }
    public FuncDef(MxstarParser.FuncDefContext ctx) {
        TypeClassifier tc = new TypeClassifier();
        pos = new Position(ctx.name);
        params = new LinkedList<>();
        stmts = new LinkedList<>();
        name = ctx.name.getText();
        type = tc.Classify(ctx.type());
        for (MxstarParser.ParameterContext tmp : ctx.parameterList().parameter()) {
            addparam(tc.Classify(tmp.type()), tmp.Identifier().getText());
        }
    }
    public void addparam(Type _t, String _s) {
        params.add(new Pair<>(_t, _s));
    }
    public void addstmt(Stmt _s) {
        stmts.add(_s);
    }
    public Position getpos() {
        return pos;
    }
}