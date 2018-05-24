package ir.inst;

import compiler.CodeGenerator;
import compiler.RegAllocator;
import ir.operand.Operand;
import ir.operand.addr.MemAddr;
import ir.operand.reg.X86Reg;

import java.util.ArrayList;
import java.util.List;

public class Call extends Inst {
    public List<Inst> Insts = new ArrayList<>();
    public int size;
    public Call(String _name, List<Operand> param, Operand dest) {
        size = param.size();
        for (int i = 0; i < param.size(); ++i) {
            Operand t = param.get(i);
            if (i < 6) Insts.add(new Move(X86Reg.getparam(i), t));
            else Insts.add(new Move(new MemAddr(X86Reg.rsp, null, 0, 8 * (i - 6)), t));
        }
        Insts.add(new FuncCall(_name, param.size()));
        if (dest != null) Insts.add(new Move(dest, X86Reg.rax));
    }
    public String toString() {
        String tmp = "";
        for (Inst t : Insts) {
            tmp += "\t" + t.toString();
        }
        return tmp;
    }
    public void accept(CodeGenerator cg) {
        cg.visit(this);
    }
    public void accept(RegAllocator ra) {
        ra.visit(this);
    }
}
