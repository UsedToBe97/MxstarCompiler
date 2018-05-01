package ast.expr;

import ast.definition.Def;
import ast.definition.FuncDef;
import ast.type.*;
import parser.MxstarParser;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class MemberFuncExpr extends Expr {
    public Expr who;
    public String name;
    public List<Expr> exprList;
    public Type type;
    public MemberFuncExpr(MxstarParser.MemberFuncExprContext ctx) {
        name = ctx.Identifier().getText();
        pos = new Position(ctx.getStart());
        exprList = new LinkedList<>();
    }
    public void add(Expr _e) {exprList.add(_e);}

    public Position getpos() {
        return pos;
    }
    public MemberFuncExpr(Expr _e, String _s, Position _p) {
        who = _e;
        name = _s;
        pos = _p;
    }

    public Type gettype() {
        if (type != null) return type;
        System.err.println("Get Type MemberFunc");
        Type t = who.gettype();
        System.err.println(t.typename());
        if (t instanceof ClassType) {
            String tmp = ((ClassType) t).name + '.' + name;
            Def d = GlobalClass.st.now.check(tmp);
            if (!(d instanceof FuncDef))
                throw new CompileError("No Member(MemberFuncExpr)", pos);
            if (((FuncDef) d).params.size() != exprList.size()) {
                throw new CompileError("MemFunc Number Not Match(MemberFuncExpr)", pos);
            } else {
                for (int i = 0; i < exprList.size(); ++i) {
                    if (!Objects.equals(exprList.get(i).gettype().typename(), ((FuncDef) d).params.get(i).getFirst().typename())) {
                        throw new CompileError("MemFunc Parameter Not Match(MemberFuncExpr)", pos);
                    }
                }
            }
            return type = ((FuncDef) d).type;
        } else if (t instanceof ArrayType) {
            if (name.equals("size") && exprList.size() == 0)
                return type = new IntType(pos);
            else throw new CompileError("No This MemFunc(MemberFuncExpr)", pos);
        } else if (t instanceof StringType) {
            if (name.equals("length") && exprList.size() == 0)
                return type = new IntType(pos);
            else if (name.equals("substring") && exprList.size() == 2)
                return type = new StringType(pos);
            else if (name.equals("parseInt") && exprList.size() == 0)
                return type = new IntType(pos);
            else if (name.equals("ord") && exprList.size() == 1)
                return type = new IntType(pos);
            else throw new CompileError("No This MemFunc(MemberFuncExpr)", pos);
        } else
            throw new CompileError("No This Class(MemberFuncExpr)", pos);
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "MemberFuncExpr : " + name + " at " + pos.toString());
        System.out.println(ss + "Who :");
        who.output(dep + 1);
        System.out.println(ss + "---Param(s)---");
        for (Expr p : exprList) {
            p.output(dep + 1);
        }
        System.out.println(ss + "---End of Param(s)---");
        System.out.println(ss + "Type : "+ type);
        System.out.println(s + "EndMemberFuncExpr : " + name + " at " + pos.toString());
    }
}