package ast.definition;

import ast.Atom;
import utils.Position;

public class Def extends Atom {
    public Position pos;
    public Position getpos() {
        return pos;
    }
}