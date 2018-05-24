package ir.inst;

import compiler.CodeGenerator;
import compiler.RegAllocator;

import java.util.ArrayList;
import java.util.List;

public class Label extends Inst{
    static int tot = 0;
    public String name;
    public ArrayList<Inst> from = new ArrayList<>();
    public List<Inst> Insts = new ArrayList<>();
    public Label(String _name) {
        name = _name;
    }
    public Label() {
        name = "Label_" + Integer.toString(tot);
        tot++;
    }
    public String toString() {
        String tmp = name + ":\n";
        return tmp;
    }
    public void accept(CodeGenerator cg) {
        cg.visit(this);
    }
    public void accept(RegAllocator ra) {
        ra.visit(this);
    }

}
