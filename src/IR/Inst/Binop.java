package ir.inst;


import ir.operand.Operand;

public class Binop extends Inst {
    public Operand lhs, rhs;
    public Operand dest;
    public String op;
    public Binop(Operand _dest, String _op, Operand _lhs, Operand _rhs){
        dest = _dest;
        op = _op;
        lhs = _lhs;
        rhs = _rhs;
    }
}
