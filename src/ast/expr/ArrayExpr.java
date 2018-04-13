package ast.expr;

import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class ArrayExpr extends Expr {
    public Expr Leftexpr;
    public List<Expr> exprList;
    public ArrayExpr(Expr _e) {
        Leftexpr = _e;
        exprList = new LinkedList<>();
    }
    public void add(Expr _e) {
        exprList.add(_e);
    }
    public Position getpos() {
        return pos;
    }
}