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
}
