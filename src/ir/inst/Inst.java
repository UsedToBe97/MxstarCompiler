package ir.inst;

import ast.Atom;
import compiler.CodeGenerator;

public abstract class Inst extends Atom {
    public abstract String toString();
    public abstract void accept(CodeGenerator cg);
}
