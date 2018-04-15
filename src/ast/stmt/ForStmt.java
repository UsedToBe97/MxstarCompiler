package ast.stmt;

import ast.expr.Expr;
import ast.type.Type;
import utils.GlobalClass;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class ForStmt extends Stmt {
    public Stmt stmt;
    public List<Expr> exprs;
    public List<Type> types = new LinkedList<>();
    public ForStmt(Position _pos) {
        exprs = new LinkedList<>();
        pos = _pos;
    }
    public ForStmt(Stmt _s, Position _pos) {
        exprs = new LinkedList<>();
        stmt = _s;
        pos = _pos;
    }
    public void add(Expr _e) {exprs.add(_e);}
    public Position getpos() {
        return pos;
    }
    public void check() {
        GlobalClass.circnt++;
        if (!(stmt instanceof BlockStmt)) GlobalClass.st.enterScope();
        for (int i = 0; i < exprs.size(); i++) {
            System.err.println(i);
            //System.err.println(exprs.get(i).gettype().typename());
            types.add(exprs.get(i).gettype());
        }

        if(stmt != null) stmt.check();

        if (!(stmt instanceof BlockStmt)) GlobalClass.st.exitScope();
        GlobalClass.circnt--;
    }
}