package ast.stmt;

import ast.Atom;
import utils.Position;

public abstract class Stmt extends Atom {
    public Position pos;
    public Stmt() {}
    public Stmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
    public abstract void check();
    public abstract void output(int dep);
}