package ast.expr;

import ast.definition.Def;
import ast.definition.FuncDef;
import ast.type.ClassType;
import ast.type.Type;
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
        Type t = who.gettype();
        if (t instanceof ClassType) {
            String tmp = ((ClassType) t).name + '.' + name;
            Def d = GlobalClass.st.now.check(tmp);
            if (!(d instanceof FuncDef))
                throw new CompileError("No Member", pos);
            if (((FuncDef) d).params.size() != exprList.size()) {
                throw new CompileError("MemFunc Number Not Match", pos);
            } else {
                for (int i = 0; i < exprList.size(); ++i) {
                    if (!Objects.equals(exprList.get(i).gettype(), ((FuncDef) d).params.get(i).getFirst())) {
                        throw new CompileError("MemFunc Parameter Not Match", pos);
                    }
                }
            }
            return ((FuncDef) d).type;
        } else throw new CompileError("No This Class", pos);
    }
}