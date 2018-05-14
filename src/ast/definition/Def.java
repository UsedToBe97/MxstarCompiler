package ast.definition;

import ast.stmt.Stmt;
import compiler.IrBuilder;
import ir.operand.Operand;
import utils.Position;

public abstract class Def extends Stmt {
    public Position pos;
    public Operand addr = null; //IR;
    public abstract Position getpos();
    public abstract String getname();
    public abstract void check();
    public abstract void output(int d);
    public abstract void accept(IrBuilder ib);
}