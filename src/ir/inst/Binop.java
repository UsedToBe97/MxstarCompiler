package ir.inst;


import compiler.CodeGenerator;
import compiler.RegAllocator;
import ir.operand.Operand;

public class Binop extends Inst {
    public Operand lhs, rhs;
    public Operand dest;
    public String op;
    public Binop(Operand _dest, String _op, Operand _lhs, Operand _rhs){
        dest = _dest;
        op = _op;
        lhs = _lhs;
        rhs = _rhs;
    }
    public String toString() {
        String tmp = "\t" + dest.toString();
        tmp += " = " + lhs.toString();
        tmp += " " + op + " " + rhs.toString() + Indef() + "\n";
        return tmp;
    }
    public void accept(CodeGenerator cg) {
        cg.visit(this);
    }
    public void accept(RegAllocator ra) {
        ra.visit(this);
    }
}
