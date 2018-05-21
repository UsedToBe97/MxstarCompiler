package ir.operand.addr;

import ir.operand.Operand;
import ir.operand.reg.Reg;

public class MemAddr extends Operand {
    public Reg base, index;
    public int scale, disp;
    public MemAddr(Reg _base, Reg _index, int _scale, int _disp) {
        base = _base; index = _index;
        scale = _scale; disp = _disp;
    }
    public MemAddr(MemAddr x) {
        this.base = x.base;
        this.index = x.index;
        this.scale = x.scale;
        this.disp = x.disp;
    }
    public String toString() {
        String tmp = "qword [" ;
        if(base != null) tmp += base.toString();
        if(index != null) {
            tmp += " + " + index.toString() + " * " + Integer.toString(scale);
        }
        if(disp != 0) {
            if(disp < 0) tmp += " - " + Integer.toString(-disp);
            else tmp += " + " + Integer.toString(disp);
        }
        tmp += "]";
        return tmp;
    }
}
