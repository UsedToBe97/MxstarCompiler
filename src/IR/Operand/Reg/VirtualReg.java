package ir.operand.reg;

public class VirtualReg extends Reg {
    public VirtualReg(int x) {
        idx = x;
        name = "r" + Integer.toString(x);
    }
}
