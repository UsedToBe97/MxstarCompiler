package ast.stmt;

import utils.Position;

public class BreakStmt extends Stmt {
    public BreakStmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
}