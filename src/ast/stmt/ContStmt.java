package ast.stmt;

import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

public class ContStmt extends Stmt {
    public ContStmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
    public void check() {
        if (GlobalClass.circnt == 0)
            throw new CompileError("No Cir to break(ContStmt)", pos);
    }
}