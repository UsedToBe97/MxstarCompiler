package ir.inst;

import ir.operand.Operand;

public class UnaryOp extends Inst {
    public Operand src;
    public String op;
    public UnaryOp(Operand _src, String _op) {
        src = _src;
        op = _op;
    }
}
