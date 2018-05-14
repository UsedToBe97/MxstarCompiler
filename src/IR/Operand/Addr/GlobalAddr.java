package ir.operand.addr;

import ir.operand.Operand;

public class GlobalAddr extends Operand {
    String name;
    boolean isConst;
    public GlobalAddr(String _s, boolean b) {
        name = _s;
        isConst = b;
    }
}
