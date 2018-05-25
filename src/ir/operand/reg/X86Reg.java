package ir.operand.reg;

import utils.CompileError;
import utils.Position;


public class X86Reg extends Reg{
    //rax rcx rdx rbx rsp rbp rsi rdi r8~15
    public static X86Reg rax = new X86Reg("rax", 13);
    public static X86Reg rcx = new X86Reg("rcx", 11);
    public static X86Reg rdx = new X86Reg("rdx", 12);
    public static X86Reg rbx = new X86Reg("rbx", 10);
    public static X86Reg rsp = new X86Reg("rsp", 14);
    public static X86Reg rbp = new X86Reg("rbp", 15);
    public static X86Reg rsi = new X86Reg("rsi", 1);
    public static X86Reg rdi = new X86Reg("rdi", 0);
    public static X86Reg r8 = new X86Reg("r8", 4);
    public static X86Reg r9 = new X86Reg("r9", 5);
    public static X86Reg r10 = new X86Reg("r10", 2);
    public static X86Reg r11 = new X86Reg("r11", 3);
    public static X86Reg r12 = new X86Reg("r12", 6);
    public static X86Reg r13 = new X86Reg("r13", 7);
    public static X86Reg r14 = new X86Reg("r14", 8);
    public static X86Reg r15 = new X86Reg("r15", 9);

    public X86Reg(String _s, int _i) {
        idx = _i;
        name = _s;
    }
    public static X86Reg get(int i) {
        if (i == 13) return rax;
        if (i == 11) return rcx;
        if (i == 12) return rdx;
        if (i == 10) return rbx;
        if (i == 14) return rsp;
        if (i == 15) return rbp;
        if (i == 1) return rsi;
        if (i == 0) return rdi;
        if (i == 4) return r8;
        if (i == 5) return r9;
        if (i == 2) return r10;
        if (i == 3) return r11;
        if (i == 6) return r12;
        if (i == 7) return r13;
        if (i == 8) return r14;
        if (i == 9) return r15;
        throw new CompileError("Reg Error", new Position(0,0));
    }
    public static X86Reg getparam(int i) {
        if (i == 0) return rdi;
        if (i == 1) return rsi;
        if (i == 2) return rdx;
        if (i == 3) return rcx;
        if (i == 4) return r8;
        if (i == 5) return r9;
        throw new CompileError("RegParam Error", new Position(0,0));
    }
    public static X86Reg caller(int i) {
        if (i == 0) return r10;
        if (i == 1) return rdi;
        if (i == 2) return rsi;
        if (i == 3) return r8;
        if (i == 4) return r9;
        if (i == 5) return r11;
        throw new CompileError("RegCaller Error", new Position(0,0));
    }
    public static X86Reg callee(int i) {
        //if (i == 1) return r11;
        if (i == 1) return r12;
        if (i == 2) return r13;
        if (i == 3) return r14;
        if (i == 0) return r15;
        throw new CompileError("RegCallee Error", new Position(0,0));
    }


    public String toString() {
        return name;
    }

}
