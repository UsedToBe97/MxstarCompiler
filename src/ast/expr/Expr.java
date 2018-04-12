package ast.expr;

import ast.Atom;
import utils.Position;

public class Expr extends Atom {
    public Position pos;
    public Position getpos() {
        return pos;
    }
}