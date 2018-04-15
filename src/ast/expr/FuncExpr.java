package ast.expr;

import ast.definition.Def;
import ast.definition.FuncDef;
import ast.type.Type;
import parser.MxstarParser;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class FuncExpr extends Expr {
    public String name;
    public List<Expr> exprList = new LinkedList<>();
    public FuncExpr(MxstarParser.FuncExprContext ctx) {
        name = ctx.Identifier().getText();
        pos = new Position(ctx.getStart());
        exprList = new LinkedList<>();
    }
    public void add(Expr _e) {exprList.add(_e);}

    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        String tmp;
        if (GlobalClass.inclass) tmp = GlobalClass.classname + "." + name;
        else tmp = name;

        if (GlobalClass.st.contains(tmp)) {
            Def d = GlobalClass.st.now.check(tmp);
            if (d instanceof FuncDef) {
                if (((FuncDef) d).params.size() != exprList.size()) {
                    throw new CompileError("Number Not Match(FuncExpr)", pos);
                } else {
                    for (int i = 0; i < exprList.size(); ++i) {
                        if (!Objects.equals(exprList.get(i).gettype().typename(), ((FuncDef) d).params.get(i).getFirst().typename())) {
                            throw new CompileError("Parameter Not Match(FuncExpr)", pos);
                        }
                    }
                }
                return (((FuncDef) d).type);
            }
            else throw new CompileError("Error Func(FuncExpr)", pos);
        } else throw new CompileError("No This Func(FuncExpr)", pos);
    }
}