package ir.inst;

import ir.operand.Operand;
import ir.operand.addr.*;
import ir.operand.reg.X86Reg;

import java.util.ArrayList;
import java.util.List;

public class Call extends Inst {
    public List<Inst> Insts = new ArrayList<>();
    public Call(String _name, List<Operand> param, Operand dest) {
        for (int i = 0; i < param.size(); ++i) {
            Operand t = param.get(i);
            if (i < 6) Insts.add(new Move(X86Reg.getparam(i), t));
            else Insts.add(new Move(new MemAddr(X86Reg.rsp, null, 0, 8 * (i - 6)), t));
        }
        Insts.add(new FuncCall(_name, param.size()));
        Insts.add(new Move(dest, X86Reg.rax));
    }
}
