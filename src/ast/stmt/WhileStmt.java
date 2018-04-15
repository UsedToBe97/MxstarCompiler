package ast.stmt;

import ast.expr.Expr;
import ast.type.BoolType;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

public class WhileStmt extends Stmt {
    public Expr expr;
    public Stmt stmt;
    public WhileStmt(Position _pos) {pos = _pos;}
    public WhileStmt(Expr _e, Stmt _s, Position _pos) {
        expr = _e;
        stmt = _s;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }

    public void check() {
        GlobalClass.circnt++;
        if (!(stmt instanceof BlockStmt)) GlobalClass.st.enterScope();
        if (!(expr.gettype() instanceof BoolType))
            throw new CompileError("Not Bool Type(WhileStmt)", pos);

        if(stmt != null) stmt.check();

        if (!(stmt instanceof BlockStmt)) GlobalClass.st.exitScope();
        GlobalClass.circnt--;
    }

}