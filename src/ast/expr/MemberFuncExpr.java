package ast.expr;

import parser.MxstarParser;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

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
}