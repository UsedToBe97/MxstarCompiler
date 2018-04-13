package ast.stmt;

import ast.Atom;
import utils.Position;

public class Stmt extends Atom {
    public Position pos;
    public Stmt() {}
    public Stmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
}