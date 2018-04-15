package ast.type;

import ast.Atom;
import utils.Position;

public abstract class Type extends Atom {
    public Position pos;
    public Position getpos() {
        return pos;
    }
    public abstract String typename();
}