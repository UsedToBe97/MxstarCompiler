package compiler;

import ir.Func;
import ir.Ir;
import ir.inst.*;
import ir.operand.Operand;
import ir.operand.addr.MemAddr;
import ir.operand.reg.VirtualReg;
import ir.operand.reg.X86Reg;

/*
rax : accumulator
rbx : base register
rcx : count register
rdx : data register
rsi : source index
rdi : dest index
rbp : base pointer
rsp : stack pointer
*/
public class CodeGenerator {
    public Func nowfunc;
    public String ans = "";
    void translate(Ir rt) {
        ans += "global main\n\n";
        ans += "section .text\n";
        for (Func u : rt.Funcs) {
            nowfunc = u;
            nowfunc.size = nowfunc.num > 16 ? nowfunc.num - 16 : 0;
            nowfunc.size *= 8;
            ans += nowfunc.name + ":\n";
            enterFunc();
            for (Inst v : u.Insts) visit(v);
            exitFunc();
        }
    }
    public void enterFunc() {
        ans += "\tpush\trbp\n";
        ans += "\tmov\trbp, rsp\n";
        ans += "\tsub\trsp, " + Integer.toString(nowfunc.size) + "\n";
    }
    public void exitFunc() {
        //ans += "\tadd\trsp, " + Integer.toString(nowfunc.size) + "\n";
        ans += "\tmov\trsp, rbp\n";
        ans += "\tpop\trbp\n";
        ans += "\tret\n";
    }
    public void visit(Inst x) {x.accept(this);}

    public void A(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs);
        rhs = getOp(rhs);
        dest = getOp(dest);
        ans += "\tmov\trdx, " + lhs.toString() + "\n";
        ans += "\t" + op + "\trdx, " + rhs.toString() + "\n";
        ans += "\tmov\t" + dest.toString() + ", rdx\n";
    }

    public void B(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs);
        rhs = getOp(rhs);
        dest = getOp(dest);
        ans += "\tmov\trcx, " + lhs.toString() + "\n";
        ans += "\tcmp\trcx, " + rhs.toString() + "\n";
        ans += "\t" + op + "\tcl\n\tmovzx\trcx, cl\n";
        ans += "\tmov\t" + dest.toString() + ", rcx\n";
    }

    public void C(Operand dest, Operand lhs, Operand rhs, String op) {

    }

    public void D(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs);
        rhs = getOp(rhs);
        dest = getOp(dest);
        ans += "\tmov\trax, " + lhs.toString() + "\n";
        ans += "\tmov\trcx, " + rhs.toString() + "\n";
        ans += "\tcqo\n\tidiv\trcx\n";
        String src = op.equals("div") ? "rax" : "rdx";
        ans += "\tmov\t" + dest.toString() + ", " + src + "\n";
    }


    public void visit(Binop x) {
        switch (x.op) {
            case "+" : A(x.dest, x.lhs, x.rhs, "add"); break;
            case "-" : A(x.dest, x.lhs, x.rhs, "sub"); break;
            case "*" : A(x.dest, x.lhs, x.rhs, "imul"); break;
            case "&" : A(x.dest, x.lhs, x.rhs, "and"); break;
            case "|" : A(x.dest, x.lhs, x.rhs, "or"); break;
            case "^" : A(x.dest, x.lhs, x.rhs, "xor"); break;

            case ">" : B(x.dest, x.lhs, x.rhs, "setg"); break;
            case "<" : B(x.dest, x.lhs, x.rhs, "setl"); break;
            case ">=" : B(x.dest, x.lhs, x.rhs, "setge"); break;
            case "<=" : B(x.dest, x.lhs, x.rhs, "setle"); break;
            case "==" : B(x.dest, x.lhs, x.rhs, "sete"); break;
            case "!=" : B(x.dest, x.lhs, x.rhs, "setne"); break;

            //case "<<" : C(x.dest, x.lhs, x.rhs, "shl"); break;
            //case ">>" : C(x.dest, x.lhs, x.rhs, "sar"); break;

            case "/" : D(x.dest, x.lhs, x.rhs, "div"); break;
            case "%" : D(x.dest, x.lhs, x.rhs, "mod"); break;
        }
    }

    public void visit(Call x) {
        for (Inst u : x.Insts) visit(u);
    }

    public void visit(CJump x) {
        x.lhs = getOp(x.lhs);
        x.rhs = getOp(x.rhs);
        ans += "\tcmp\t" + x.lhs.toString() + ", " + x.rhs.toString() +"\n";
        ans += "\t" + x.op + "\t" + x.dest.name +"\n";
    }

    public void visit(FuncCall x) {
        ans += "\tcall\t" + x.name + "\n";
    }

    public void visit(Label x) {
        ans += x.name + ":\n";
    }

    public void visit(Move x) {
        x.dest = getOp(x.dest);
        x.src = getOp(x.src);
        if (!x.src.toString().equals("rax"))
            ans += "\tmov\trax, " + x.src.toString() + "\n";
        if (!x.dest.toString().equals("rax"))
            ans += "\tmov\t" + x.dest.toString() + ", rax\n";
    }

    public void visit(UnaryOp x) {
        x.src = getOp(x.src);
        if (x.op.equals("~")) {
            ans += "\tnot\t" + x.src.toString() + ", 1\n";
        }
        if (x.op.equals("!")) {
            ans += "\txor\t" + x.src.toString() + ", 1\n";
        }
        if (x.op.equals("-")) {
            ans += "\tneg\t" + x.src.toString() + ", 1\n";
        }
    }

    public void visit(Jump x) {
        ans += "\tjmp\t" + x.label.name + "\n";
    }

    public Operand getOp(Operand x) {
        if (x instanceof VirtualReg) {
            if (((VirtualReg) x).idx < 16) return X86Reg.get(((VirtualReg) x).idx);
            else return new MemAddr(X86Reg.rbp, null, 0, -(((VirtualReg) x).idx - 15) * 8);
        }

        if (x instanceof MemAddr) {
            Operand base = getOp(((MemAddr) x).base);
            Operand index = getOp(((MemAddr) x).index);
            if (base instanceof X86Reg && index instanceof X86Reg) {
                return new MemAddr((X86Reg)base, (X86Reg)index, ((MemAddr) x).scale, ((MemAddr) x).disp);
            } else {
                if (index != null) {
                    ans += "\tmov\trbx, " + index.toString() + "\n";
                    ans += "\timul\trbx, " + Integer.toString(((MemAddr) x).scale) + "\n";
                    ans += "\timul\trbx, " + base.toString() +"\n";
                } else ans += "\tmov\trbx, " + base +"\n";
                return new MemAddr(X86Reg.rbx, null, 0, ((MemAddr) x).disp);
            }
        }

        return x;
    }
}
