package ir.inst;

public class Jump extends Inst {
    Label label;
    public Jump(Label _label) {label = _label;}

    public String toString() {
        String tmp = "\t";
        tmp += "jump " + label.name + "\n";
        return tmp;
    }
}
