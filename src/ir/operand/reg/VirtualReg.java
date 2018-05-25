package ir.operand.reg;

public class VirtualReg extends Reg {
    public VirtualReg(int x) {
        idx = x;
        name = "r" + Integer.toString(x);
    }
    public String toString() {
        if(idx < 16) {
            return X86Reg.get(idx).toString();
        }
        return "reg" + idx;
    }
}
