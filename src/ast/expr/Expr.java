package ast.expr;

import ast.Atom;
import ast.type.Type;
import compiler.IrBuilder;
import ir.operand.Operand;
import utils.Position;

import java.util.HashMap;

public abstract class Expr extends Atom {
    public Position pos;
    public Operand operand = null; //IR
    public Position getpos() {
        return pos;
    }
    public boolean del = false;
    public abstract Type gettype();
    public abstract void output(int dep);
    public abstract void accept(IrBuilder ib);
    public abstract Expr getinline(HashMap<String, Operand> map);
}