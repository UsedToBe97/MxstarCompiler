package ir.inst;

import compiler.CodeGenerator;
import compiler.RegAllocator;
import ir.operand.Operand;

public class Move extends Inst {
    public Operand dest, src;
    public Move(Operand _d, Operand _s){
        dest = _d;
        src = _s;
    }
    public String toString() {
        String tmp = "\t";
        if (dest == null) {
            tmp += " FUCK!!! " + src.toString() + "\n";
        }else
        tmp += dest.toString() + " = " + src.toString() + "\n";
        return tmp;
    }
    public void accept(CodeGenerator cg) {
        cg.visit(this);
    }
    public void accept(RegAllocator ra) {
        ra.visit(this);
    }
}
