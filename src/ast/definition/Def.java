package ast.definition;

import ast.stmt.Stmt;
import utils.Position;

public class Def extends Stmt {
    public Position pos;
    public Position getpos() {
        return pos;
    }
}