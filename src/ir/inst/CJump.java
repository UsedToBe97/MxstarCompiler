package ir.inst;

import ir.operand.Operand;

public class CJump extends Inst{
    public String op;
    public Operand lhs, rhs;
    public Label dest;
    public CJump(Operand _lhs, Operand _rhs, String _op, Label _dest) {
        lhs = _lhs; rhs = _rhs;
        op = _op; dest = _dest;
    }
    public String toString() {
        String tmp = "\t";
        tmp += "jump " + dest.name + " if ";
        tmp += lhs.toString() + " " + op + " " + rhs.toString() + "\n";
        return tmp;
    }
}
