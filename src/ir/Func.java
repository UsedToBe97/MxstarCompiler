package ir;

import ir.inst.Inst;
import ir.operand.Operand;
import ir.operand.reg.Reg;
import ir.operand.reg.VirtualReg;
import ir.operand.reg.X86Reg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Func {
    public String name;
    public List<Inst> Insts = new ArrayList<>();
    public List<Reg> Regs = new ArrayList<>();
    public int num = 16, size;
    public HashMap<String, Operand> defMap = new HashMap<>();
    public Func(String _name) {
        name = _name;
        for (int i = 0; i < 16; ++i) Regs.add(X86Reg.get(i));
    }
    public void addInst(Inst x) {Insts.add(x);}
    public VirtualReg newReg() {
        VirtualReg tmp = new VirtualReg(num++);
        Regs.add(tmp);
        return tmp;
    }

    public String toString() {
        String tmp = name + " [Func]:\n";
        for (Inst t : Insts) tmp += t.toString();
        return tmp;
    }


}
