package ir.inst;

import ast.Atom;
import compiler.CodeGenerator;
import compiler.RegAllocator;
import ir.operand.Operand;
import ir.operand.addr.MemAddr;
import ir.operand.reg.Reg;

import java.util.HashSet;
import java.util.Set;

public abstract class Inst extends Atom {
    public Set<Reg> in = new HashSet<>();
    public Reg def;
    public Inst nxt;
    public void set(Operand y) {if (y instanceof Reg) def = (Reg) y;}
    public void add(Operand x) {
        if (x instanceof MemAddr) {
            if (((MemAddr) x).index != null) in.add(((MemAddr) x).index);
            if (((MemAddr) x).base != null) in.add(((MemAddr) x).base);
        } else if (x instanceof Reg) in.add((Reg)x);
    }
    public abstract String toString();
    public abstract void accept(CodeGenerator cg);
    public abstract void accept(RegAllocator ra);
}
