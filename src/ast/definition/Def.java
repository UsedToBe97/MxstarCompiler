package ast.definition;

import ast.stmt.Stmt;
import utils.Position;

public abstract class Def extends Stmt {
    public Position pos;
    public abstract Position getpos();
    public abstract String getname();
    public abstract void check();
    public abstract void output(int d);
}