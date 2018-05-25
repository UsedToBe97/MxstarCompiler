package ir.inst;

import compiler.CodeGenerator;
import compiler.RegAllocator;
import ir.operand.Operand;

public class CJump extends Inst{
    public String op;
    public Operand lhs, rhs;
    public Label dest;

    public CJump(Operand _lhs, Operand _rhs, String _op, Label _dest) {
        lhs = _lhs; rhs = _rhs;
        op = _op; dest = _dest;
    }
    public String toString() {
        String tmp = "\t";
        tmp += "jump " + dest.name + " if ";
        tmp += lhs.toString() + " " + op + " " + rhs.toString() + Indef() + "\n";
        return tmp;
    }
    public void accept(CodeGenerator cg) {
        cg.visit(this);
    }
    public void accept(RegAllocator ra) {
        ra.visit(this);
    }
}
