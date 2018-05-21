package ir.inst;

import java.util.ArrayList;
import java.util.List;

public class Label extends Inst{
    static int tot = 0;
    public String name;
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

}
