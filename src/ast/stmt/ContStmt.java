package ast.stmt;

import utils.Position;

public class ContStmt extends Stmt {
    public ContStmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
}