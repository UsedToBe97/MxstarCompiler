package ir.inst;

import compiler.CodeGenerator;

public class Jump extends Inst {
    public Label label;
    public Jump(Label _label) {label = _label;}

    public String toString() {
        String tmp = "\t";
        tmp += "jump " + label.name + "\n";
        return tmp;
    }
    public void accept(CodeGenerator cg) {
        cg.visit(this);
    }
}
