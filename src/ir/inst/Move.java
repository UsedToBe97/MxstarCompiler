package ir.inst;

import ir.operand.Operand;

public class Move extends Inst {
    public Operand dest, src;
    public Move(Operand _d, Operand _s){
        dest = _d;
        src = _s;
    }
}
