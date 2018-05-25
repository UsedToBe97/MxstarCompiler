package ir.inst;

import compiler.CodeGenerator;
import compiler.RegAllocator;

public class FuncCall extends Inst {
    public String name;
    public int n;
    public FuncCall(String _name, int _n){
        name = _name;
        n = _n;
    }

    public String toString() {
        String tmp = "\t" + "FuncCall " + name + " Param_size : " + n + Indef() + "\n";
        return tmp;
    }
    public void accept(CodeGenerator cg) {
        cg.visit(this);
    }
    public void accept(RegAllocator ra) {
        ra.visit(this);
    }

}
