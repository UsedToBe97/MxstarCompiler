package ast.expr;

import ast.Atom;
import ast.type.Type;
import utils.Position;

public abstract class Expr extends Atom {
    public Position pos;
    public Position getpos() {
        return pos;
    }
    public abstract Type gettype();
    public abstract void output(int dep);
}