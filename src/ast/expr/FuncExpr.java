package ast.expr;

import ast.definition.Def;
import ast.definition.FuncDef;
import ast.type.ClassType;
import ast.type.NullType;
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
    public Type type = null;
    public FuncExpr(MxstarParser.FuncExprContext ctx) {
        name = ctx.Identifier().getText();
        pos = new Position(ctx.getStart());
    }
    public void add(Expr _e) {exprList.add(_e);}

    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        String tmp;
        if (GlobalClass.inclass) tmp = GlobalClass.classname + "." + name;
        else tmp = name;
        System.err.println(tmp);
        if (GlobalClass.st.contains(tmp) || GlobalClass.st.contains(name)) {
            Def d;
            if (!GlobalClass.st.contains(tmp)) d = GlobalClass.st.now.check(name);
            else d = GlobalClass.st.now.check(tmp);
            if (d instanceof FuncDef) {
                if (((FuncDef) d).params.size() != exprList.size()) {
                    throw new CompileError("Number Not Match(FuncExpr)", pos);
                } else {
                    for (int i = 0; i < exprList.size(); ++i) {
                        if (!Objects.equals(exprList.get(i).gettype().typename(), ((FuncDef) d).params.get(i).getFirst().typename())) {
                            if (!(exprList.get(i).gettype() instanceof ClassType && ((FuncDef) d).params.get(i).getFirst() instanceof NullType))
                                if (!(exprList.get(i).gettype() instanceof NullType && ((FuncDef) d).params.get(i).getFirst() instanceof ClassType))
                                    throw new CompileError("Parameter Not Match(FuncExpr)", pos);
                        }
                    }
                }
                return type = (((FuncDef) d).type);
            }
            else throw new CompileError("Error Func(FuncExpr)", pos);
        } else throw new CompileError("No This Func(FuncExpr)", pos);
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        System.out.println(s + "FuncExpr : " + name + " with Type " + type.typename());
        ss = s + "\t";
        System.out.println(ss + "---Param(s)---");
        for (Expr p : exprList) {
            p.output(dep + 1);
        }
        System.out.println(ss + "---End of Param(s)---");
        System.out.println(s + "EndFuncExpr : " + name + " at " + pos.toString());
    }
}