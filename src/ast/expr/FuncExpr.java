package ast.expr;

import ast.definition.Def;
import ast.definition.FuncDef;
import ast.type.*;
import compiler.IrBuilder;
import ir.operand.Operand;
import parser.MxstarParser;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.*;

public class FuncExpr extends Expr {
    public String name;
    public List<Expr> exprList = new LinkedList<>();
    public Type type = null;
    public Boolean isMemFunc = false;
    public FuncDef funcDef = null;
    public FuncExpr(MxstarParser.FuncExprContext ctx) {
        name = ctx.Identifier().getText();
        pos = new Position(ctx.getStart());
    }
    public FuncExpr(MxstarParser.MemberFuncExprContext ctx) {
        name = ctx.Identifier().getText();
        pos = new Position(ctx.getStart());
        exprList = new LinkedList<>();
    }
    public void add(Expr _e) {exprList.add(_e);}

    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        if (name.substring(0,1).contains("_"))
            throw new CompileError("Name Error(FuncExpr)", pos);
        String tmp;
        if (GlobalClass.inclass) tmp = GlobalClass.classname + "." + name;
        else tmp = name;
        if (exprList.size() > 0 && exprList.get(0).gettype() instanceof ClassType) {
            //GlobalClass.inclass = true;
            //GlobalClass.classname = ((ClassType) exprList.get(0).gettype()).name;
            tmp = ((ClassType) exprList.get(0).gettype()).name + "." + name;
        }

        String _name = name;
        if (isMemFunc) {
            System.err.println(tmp);
            Type t = exprList.get(0).gettype();
            if (t instanceof ClassType) {
                _name = ((ClassType) t).name + "." + name;
            } else if (t instanceof StringType) {
                _name = "string." + name;
            } else if (t instanceof ArrayType) {
                _name = "array." + name;
            }
        }

        if (GlobalClass.st.contains(tmp) || GlobalClass.st.contains(_name)) {
            Def d;
            /*if (!GlobalClass.st.contains(tmp)) d = GlobalClass.st.now.check(_name);
            else d = GlobalClass.st.now.check(tmp);*/
            if (!GlobalClass.st.contains(tmp)) d = GlobalClass.st.now.check(_name);
            else if (!GlobalClass.st.contains(_name)) d = GlobalClass.st.now.check(tmp);
            else if (GlobalClass.st.now.getDep(_name) < GlobalClass.st.now.getDep(tmp)) d = GlobalClass.st.now.check(_name);
            else d = GlobalClass.st.now.check(tmp);
            if (d instanceof FuncDef) {
                funcDef = (FuncDef) d;
                if (((FuncDef) d).params.size() != exprList.size()) {
                    throw new CompileError("Number Not Match(FuncExpr)", pos);
                } else {
                    if (!_name.equals("array.size")) for (int i = 0; i < exprList.size(); ++i) {
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
        if (type == null) type = gettype();
        System.err.println(s + "FuncExpr : " + name + " with Type " + type.typename());
        ss = s + "\t";
        System.err.println(ss + "---Param(s)---");
        for (Expr p : exprList) {
            p.output(dep + 1);
        }
        System.err.println(ss + "---End of Param(s)---");
        System.err.println(s + "EndFuncExpr : " + name + " at " + pos.toString());
    }
    public FuncExpr() {}
    public Expr getinline(HashMap<String, Operand> map) {
        FuncExpr tmp = new FuncExpr();
        tmp.isMemFunc = isMemFunc;
        tmp.exprList = new ArrayList<>();
        tmp.type = type;
        tmp.name = name;
        tmp.funcDef = funcDef;
        for (Expr u : exprList) tmp.exprList.add(u.getinline(map));
        return tmp;
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}