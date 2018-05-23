package compiler;

import ast.definition.VarDef;
import ir.Func;
import ir.Ir;
import ir.inst.*;
import ir.operand.Operand;
import ir.operand.addr.MemAddr;
import ir.operand.reg.Reg;
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
        lhs = getOp(lhs, X86Reg.r10);
        rhs = getOp(rhs, X86Reg.r11);
        dest = getOp(dest, X86Reg.r12);
        ans += "\tmov\trdx, " + lhs.toString() + "\n";
        ans += "\t" + op + "\trdx, " + rhs.toString() + "\n";
        ans += "\tmov\t" + dest.toString() + ", rdx\n";
    }

    public void B(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.r10);
        rhs = getOp(rhs, X86Reg.r11);
        dest = getOp(dest, X86Reg.r12);
        ans += "\tmov\trcx, " + lhs.toString() + "\n";
        ans += "\tcmp\trcx, " + rhs.toString() + "\n";
        ans += "\t" + op + "\tcl\n\tmovzx\trcx, cl\n";
        ans += "\tmov\t" + dest.toString() + ", rcx\n";
    }

    public void C(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.r10);
        rhs = getOp(rhs, X86Reg.r11);
        dest = getOp(dest, X86Reg.r12);
        ans += "\tmov\trax, " + lhs.toString() + "\n";
        ans += "\tmov\trcx, " + rhs.toString() + "\n";
        ans += "\t" + op + "\trax, cl\n";
        ans += "\tmov\t" + dest.toString() + ", rax\n";
    }

    public void D(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.r10);
        rhs = getOp(rhs, X86Reg.r11);
        dest = getOp(dest, X86Reg.r12);
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

            case "<<" : C(x.dest, x.lhs, x.rhs, "shl"); break;
            case ">>" : C(x.dest, x.lhs, x.rhs, "shr"); break;

            case "/" : D(x.dest, x.lhs, x.rhs, "div"); break;
            case "%" : D(x.dest, x.lhs, x.rhs, "mod"); break;
        }
    }

    public void visit(Call x) {
        int tmp = (x.size - 6) * 8;
        if(tmp != 0) ans += "\tsub\trsp, " + Integer.toString(tmp) + "\n";
        for (Inst u : x.Insts) visit(u);
    }

    public void visit(CJump x) {
        x.lhs = getOp(x.lhs, X86Reg.r10);
        x.rhs = getOp(x.rhs, X86Reg.r11);
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
        x.src = getOp(x.src, X86Reg.rbx);
        if (!x.src.toString().equals("rax"))
            ans += "\tmov\trax, " + x.src.toString() + "\n";


        x.dest = getOp(x.dest, X86Reg.rbx);
        if (!x.dest.toString().equals("rax"))
            ans += "\tmov\t" + x.dest.toString() + ", rax\n";
    }

    public void visit(UnaryOp x) {
        x.src = getOp(x.src, X86Reg.rbx);
        if (x.op.equals("~")) {
            ans += "\tnot\t" + x.src.toString() + "\n";
        }
        if (x.op.equals("!")) {
            ans += "\txor\t" + x.src.toString() + ", 1\n";
        }
        if (x.op.equals("-")) {
            ans += "\tneg\t" + x.src.toString() + "\n";
        }
    }

    public void visit(Jump x) {
        ans += "\tjmp\t" + x.label.name + "\n";
    }

    public Operand getOp(Operand x, Reg tmp) {
        if (x instanceof VirtualReg) {
            if (((VirtualReg) x).idx < 16) return X86Reg.get(((VirtualReg) x).idx);
            else return new MemAddr(X86Reg.rbp, null, 0, -(((VirtualReg) x).idx - 15) * 8);
        }

        if (x instanceof MemAddr) {
            Operand base = getOp(((MemAddr) x).base, null);
            Operand index = getOp(((MemAddr) x).index, null);
            if (base instanceof X86Reg && index instanceof X86Reg) {
                return new MemAddr((X86Reg)base, (X86Reg)index, ((MemAddr) x).scale, ((MemAddr) x).disp);
            } else {
                if (index != null) {
                    ans += "\tmov\t" + tmp.name + ", " + index.toString() + "\n";
                    ans += "\timul\t" + tmp.name + ", " + Integer.toString(((MemAddr) x).scale) + "\n";
                    ans += "\tadd\t" + tmp.name + ", " + base.toString() +"\n";
                } else ans += "\tmov\t" + tmp.name + ", " + base +"\n";
                return new MemAddr(tmp, null, 0, ((MemAddr) x).disp);
            }
        }

        return x;
    }
    void translate(Ir rt) {
        int cc = 0;
        ans += "global main\n\n";
        ans += "extern puts\n";
        ans += "extern getchar\n";
        ans += "extern putchar\n";
        ans += "extern __stack_chk_fail\n";
        ans += "extern malloc\n";
        ans += "extern printf\n";
        ans += "extern gets\n";
        ans += "extern __isoc99_scanf\n";

        ans += "section .data\n";
        for (String u : rt.SC) {
            ans += "\tdq\t" + u.length() + "\nstr__" + Integer.toString(cc++) + ":\n\tdb\t";
            for (int i = 0; i < u.length(); ++i) ans += Integer.toString((int)u.charAt(i)) + ", ";
            ans += "0\n";
        }
        for (VarDef u : rt.GV) ans += u.name + ":\n\tdq\t0\n";


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
        Builtin();
    }
    public void Builtin() {
        //toString
        ans += "toString:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tsub     rsp, 1088\n";
        ans += "\tmov     dword [rbp-434H], edi\n";
        ans += "\tmov     rax, qword [fs:abs 28H]\n";
        ans += "\tmov     qword [rbp-8H], rax\n";
        ans += "\txor     eax, eax\n";
        ans += "\tmov     edi, 256\n";
        ans += "\tcall    malloc\n";
        ans += "\tmov     qword [rbp-418H], rax\n";
        ans += "\tmov     dword [rbp-424H], 0\n";
        ans += "\tcmp     dword [rbp-434H], 0\n";
        ans += "\tjnz     L_001\n";
        ans += "\tmov     rax, qword [rbp-418H]\n";
        ans += "\tmov     byte [rax], 48\n";
        ans += "\tmov     rax, qword [rbp-418H]\n";
        ans += "\tadd     rax, 1\n";
        ans += "\tmov     byte [rax], 0\n";
        ans += "\tmov     rax, qword [rbp-418H]\n";
        ans += "\tjmp     L_007\n";
        ans += "L_001:  cmp     dword [rbp-434H], 0\n";
        ans += "\tjns     L_002\n";
        ans += "\tmov     rax, qword [rbp-418H]\n";
        ans += "\tmov     byte [rax], 45\n";
        ans += "\tneg     dword [rbp-434H]\n";
        ans += "\tmov     dword [rbp-424H], 1\n";
        ans += "L_002:  mov     dword [rbp-420H], 0\n";
        ans += "\tjmp     L_004\n";
        ans += "L_003:  mov     esi, dword [rbp-420H]\n";
        ans += "\tlea     eax, [rsi+1H]\n";
        ans += "\tmov     dword [rbp-420H], eax\n";
        ans += "\tmov     ecx, dword [rbp-434H]\n";
        ans += "\tmov     edx, 1717986919\n";
        ans += "\tmov     eax, ecx\n";
        ans += "\timul    edx\n";
        ans += "\tsar     edx, 2\n";
        ans += "\tmov     eax, ecx\n";
        ans += "\tsar     eax, 31\n";
        ans += "\tsub     edx, eax\n";
        ans += "\tmov     eax, edx\n";
        ans += "\tshl     eax, 2\n";
        ans += "\tadd     eax, edx\n";
        ans += "\tadd     eax, eax\n";
        ans += "\tsub     ecx, eax\n";
        ans += "\tmov     edx, ecx\n";
        ans += "\tmovsxd  rax, esi\n";
        ans += "\tmov     dword [rbp+rax*4-410H], edx\n";
        ans += "\tmov     ecx, dword [rbp-434H]\n";
        ans += "\tmov     edx, 1717986919\n";
        ans += "\tmov     eax, ecx\n";
        ans += "\timul    edx\n";
        ans += "\tsar     edx, 2\n";
        ans += "\tmov     eax, ecx\n";
        ans += "\tsar     eax, 31\n";
        ans += "\tsub     edx, eax\n";
        ans += "\tmov     eax, edx\n";
        ans += "\tmov     dword [rbp-434H], eax\n";
        ans += "L_004:  cmp     dword [rbp-434H], 0\n";
        ans += "\tjnz     L_003\n";
        ans += "\tmov     dword [rbp-41CH], 0\n";
        ans += "\tjmp     L_006\n";
        ans += "L_005:  mov     edx, dword [rbp-424H]\n";
        ans += "\tmov     eax, dword [rbp-41CH]\n";
        ans += "\tadd     eax, edx\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-418H]\n";
        ans += "\tadd     rdx, rax\n";
        ans += "\tmov     eax, dword [rbp-420H]\n";
        ans += "\tsub     eax, 1\n";
        ans += "\tsub     eax, dword [rbp-41CH]\n";
        ans += "\tcdqe\n";
        ans += "\tmov     eax, dword [rbp+rax*4-410H]\n";
        ans += "\tadd     eax, 48\n";
        ans += "\tmov     byte [rdx], al\n";
        ans += "\tadd     dword [rbp-41CH], 1\n";
        ans += "L_006:  mov     eax, dword [rbp-41CH]\n";
        ans += "\tcmp     eax, dword [rbp-420H]\n";
        ans += "\tjl      L_005\n";
        ans += "\tmov     edx, dword [rbp-424H]\n";
        ans += "\tmov     eax, dword [rbp-420H]\n";
        ans += "\tadd     eax, edx\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-418H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmov     byte [rax], 0\n";
        ans += "\tmov     rax, qword [rbp-418H]\n";
        ans += "L_007:  mov     rdi, qword [rbp-8H]\n";
        ans += "\txor     rdi, qword [fs:abs 28H]\n";
        ans += "\tjz      L_008\n";
        ans += "\tcall    __stack_chk_fail\n";
        ans += "L_008:  leave\n";
        ans += "\t        ret\n";


        //println
        ans += "println:\n";
        ans += "\tcall puts\n";
        ans += "\tret\n\n";

        //array.size
        ans += "array.size:\n";
        ans += "\tmov\trax, qword [rdi - 8]\n";
        ans += "\tret\n\n";

        //string.add
        ans += "string.add:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tsub     rsp, 48\n";
        ans += "\tmov     qword [rbp-28H], rdi\n";
        ans += "\tmov     qword [rbp-30H], rsi\n";
        ans += "\tmov     edi, 256\n";
        ans += "\tcall    malloc\n";
        ans += "\tmov     qword [rbp-8H], rax\n";
        ans += "\tmov     dword [rbp-14H], 0\n";
        ans += "\tmov     dword [rbp-10H], 0\n";
        ans += "\tjmp     Ladd_002\n";
        ans += "Ladd_001:  add     dword [rbp-14H], 1\n";
        ans += "Ladd_002:  mov     eax, dword [rbp-14H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-28H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\ttest    al, al\n";
        ans += "\tjnz     Ladd_001\n";
        ans += "\tjmp     Ladd_004\n";
        ans += "Ladd_003:  add     dword [rbp-10H], 1\n";
        ans += "Ladd_004:  mov     eax, dword [rbp-10H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-30H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\ttest    al, al\n";
        ans += "\tjnz     Ladd_003\n";
        ans += "\tmov     dword [rbp-0CH], 0\n";
        ans += "\tjmp     Ladd_006\n";
        ans += "Ladd_005:  mov     eax, dword [rbp-0CH]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-8H]\n";
        ans += "\tadd     rdx, rax\n";
        ans += "\tmov     eax, dword [rbp-0CH]\n";
        ans += "\tmovsxd  rcx, eax\n";
        ans += "\tmov     rax, qword [rbp-28H]\n";
        ans += "\tadd     rax, rcx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tmov     byte [rdx], al\n";
        ans += "\tadd     dword [rbp-0CH], 1\n";
        ans += "Ladd_006:  mov     eax, dword [rbp-0CH]\n";
        ans += "\tcmp     eax, dword [rbp-14H]\n";
        ans += "\tjl      Ladd_005\n";
        ans += "\tmov     eax, dword [rbp-14H]\n";
        ans += "\tmov     dword [rbp-0CH], eax\n";
        ans += "\tjmp     Ladd_008\n";
        ans += "Ladd_007:  mov     eax, dword [rbp-0CH]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-8H]\n";
        ans += "\tadd     rdx, rax\n";
        ans += "\tmov     eax, dword [rbp-0CH]\n";
        ans += "\tsub     eax, dword [rbp-14H]\n";
        ans += "\tmovsxd  rcx, eax\n";
        ans += "\tmov     rax, qword [rbp-30H]\n";
        ans += "\tadd     rax, rcx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tmov     byte [rdx], al\n";
        ans += "\tadd     dword [rbp-0CH], 1\n";
        ans += "Ladd_008:  mov     edx, dword [rbp-14H]\n";
        ans += "\tmov     eax, dword [rbp-10H]\n";
        ans += "\tadd     eax, edx\n";
        ans += "\tcmp     eax, dword [rbp-0CH]\n";
        ans += "\tjg      Ladd_007\n";
        ans += "\tmov     edx, dword [rbp-14H]\n";
        ans += "\tmov     eax, dword [rbp-10H]\n";
        ans += "\tadd     eax, edx\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-8H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmov     byte [rax], 0\n";
        ans += "\tmov     rax, qword [rbp-8H]\n";
        ans += "\tleave\n";
        ans += "\t        ret\n";

        //getInt
        ans += "getInt:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tsub     rsp, 16\n";
        ans += "\tcall    getchar\n";
        ans += "\tmov     byte [rbp-5H], al\n";
        ans += "\tmov     dword [rbp-4H], 0\n";
        ans += "\tjmp     Lint_002\n";
        ans += "Lint_001:  mov     edx, dword [rbp-4H]\n";
        ans += "\tmov     eax, edx\n";
        ans += "\tshl     eax, 2\n";
        ans += "\tadd     eax, edx\n";
        ans += "\tadd     eax, eax\n";
        ans += "\tmov     edx, eax\n";
        ans += "\tmovsx   eax, byte [rbp-5H]\n";
        ans += "\tadd     eax, edx\n";
        ans += "\tsub     eax, 48\n";
        ans += "\tmov     dword [rbp-4H], eax\n";
        ans += "\tcall    getchar\n";
        ans += "\tmov     byte [rbp-5H], al\n";
        ans += "Lint_002:  cmp     byte [rbp-5H], 47\n";
        ans += "\tjle     Lint_003\n";
        ans += "\tcmp     byte [rbp-5H], 57\n";
        ans += "\tjle     Lint_001\n";
        ans += "Lint_003:  mov     eax, dword [rbp-4H]\n";
        ans += "\tleave\n";
        ans += "\t        ret\n";

        //string.length
        ans += "string.length:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tmov     qword [rbp-18H], rdi\n";
        ans += "\tmov     dword [rbp-4H], 0\n";
        ans += "\tjmp     Llen_002\n";
        ans += "Llen_001:  add     dword [rbp-4H], 1\n";
        ans += "Llen_002:  mov     eax, dword [rbp-4H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\ttest    al, al\n";
        ans += "\tjnz     Llen_001\n";
        ans += "\tmov     eax, dword [rbp-4H]\n";
        ans += "\tpop     rbp\n";
        ans += "\tret\n";

        //string.ord
        ans += "string.ord:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tmov     qword [rbp-18H], rdi\n";
        ans += "\tmov     dword [rbp-1CH], esi\n";
        ans += "\tmov     eax, dword [rbp-1CH]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tmovsx   eax, al\n";
        ans += "\tmov     dword [rbp-4H], eax\n";
        ans += "\tmov     eax, dword [rbp-4H]\n";
        ans += "\tpop     rbp\n";
        ans += "\tret\n";

        //print
        ans += "print:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tsub     rsp, 32\n";
        ans += "\tmov     qword [rbp-18H], rdi\n";
        ans += "\tmov     dword [rbp-8H], 0\n";
        ans += "\tjmp     Lprt_002\n";
        ans += "Lprt_001:  add     dword [rbp-8H], 1\n";
        ans += "Lprt_002:  mov     eax, dword [rbp-8H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\ttest    al, al\n";
        ans += "\tjnz     Lprt_001\n";
        ans += "\tmov     dword [rbp-4H], 0\n";
        ans += "\tjmp     Lprt_010\n";
        ans += "Lprt_003:  mov     eax, dword [rbp-4H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tcmp     al, 92\n";
        ans += "\tjne     Lprt_008\n";
        ans += "\tmov     eax, dword [rbp-4H]\n";
        ans += "\tadd     eax, 1\n";
        ans += "\tcmp     eax, dword [rbp-8H]\n";
        ans += "\tjge     Lprt_008\n";
        ans += "\tmov     eax, dword [rbp-4H]\n";
        ans += "\tcdqe\n";
        ans += "\tlea     rdx, [rax+1H]\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tcmp     al, 110\n";
        ans += "\tjnz     Lprt_004\n";
        ans += "\tmov     edi, 10\n";
        ans += "\tcall    putchar\n";
        ans += "\tadd     dword [rbp-4H], 1\n";
        ans += "\tjmp     Lprt_009\n";
        ans += "Lprt_004:  mov     eax, dword [rbp-4H]\n";
        ans += "\tcdqe\n";
        ans += "\tlea     rdx, [rax+1H]\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tcmp     al, 116\n";
        ans += "\tjnz     Lprt_005\n";
        ans += "\tmov     edi, 9\n";
        ans += "\tcall    putchar\n";
        ans += "\tadd     dword [rbp-4H], 1\n";
        ans += "\tjmp     Lprt_009\n";
        ans += "Lprt_005:  mov     eax, dword [rbp-4H]\n";
        ans += "\tcdqe\n";
        ans += "\tlea     rdx, [rax+1H]\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tcmp     al, 92\n";
        ans += "\tjnz     Lprt_006\n";
        ans += "\tmov     edi, 92\n";
        ans += "\tcall    putchar\n";
        ans += "\tadd     dword [rbp-4H], 1\n";
        ans += "\tjmp     Lprt_009\n";
        ans += "Lprt_006:  mov     eax, dword [rbp-4H]\n";
        ans += "\tcdqe\n";
        ans += "\tlea     rdx, [rax+1H]\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tcmp     al, 34\n";
        ans += "\tjnz     Lprt_007\n";
        ans += "\tmov     edi, 34\n";
        ans += "\tcall    putchar\n";
        ans += "\tadd     dword [rbp-4H], 1\n";
        ans += "\tjmp     Lprt_009\n";
        ans += "Lprt_007:  mov     eax, dword [rbp-4H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tmovsx   eax, al\n";
        ans += "\tmov     edi, eax\n";
        ans += "\tcall    putchar\n";
        ans += "\tjmp     Lprt_009\n";
        ans += "Lprt_008:  mov     eax, dword [rbp-4H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tmovsx   eax, al\n";
        ans += "\tmov     edi, eax\n";
        ans += "\tcall    putchar\n";
        ans += "Lprt_009:  add     dword [rbp-4H], 1\n";
        ans += "Lprt_010:  mov     eax, dword [rbp-4H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\ttest    al, al\n";
        ans += "\tjne     Lprt_003\n";
        ans += "\tnop\n";
        ans += "\t        leave\n";
        ans += "\tret\n";

        //getString
        ans += "getString:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tsub     rsp, 288\n";
        ans += "\tmov     rax, qword [fs:abs 28H]\n";
        ans += "\tmov     qword [rbp-8H], rax\n";
        ans += "\txor     eax, eax\n";
        ans += "\tlea     rax, [rbp-110H]\n";
        ans += "\tmov     rdi, rax\n";
        ans += "\tmov     eax, 0\n";
        ans += "\tcall    gets\n";
        ans += "\tmov     edi, 256\n";
        ans += "\tcall    malloc\n";
        ans += "\tmov     qword [rbp-118H], rax\n";
        ans += "\tmov     dword [rbp-120H], 0\n";
        ans += "\tjmp     Lgs_002\n";
        ans += "Lgs_001:  add     dword [rbp-120H], 1\n";
        ans += "Lgs_002:  mov     eax, dword [rbp-120H]\n";
        ans += "\tcdqe\n";
        ans += "\tmovzx   eax, byte [rbp+rax-110H]\n";
        ans += "\ttest    al, al\n";
        ans += "\tjnz     Lgs_001\n";
        ans += "\tmov     dword [rbp-11CH], 0\n";
        ans += "\tmov     dword [rbp-11CH], 0\n";
        ans += "\tjmp     Lgs_004\n";
        ans += "Lgs_003:  mov     eax, dword [rbp-11CH]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-118H]\n";
        ans += "\tadd     rdx, rax\n";
        ans += "\tmov     eax, dword [rbp-11CH]\n";
        ans += "\tcdqe\n";
        ans += "\tmovzx   eax, byte [rbp+rax-110H]\n";
        ans += "\tmov     byte [rdx], al\n";
        ans += "\tadd     dword [rbp-11CH], 1\n";
        ans += "Lgs_004:  mov     eax, dword [rbp-11CH]\n";
        ans += "\tcmp     eax, dword [rbp-120H]\n";
        ans += "\tjl      Lgs_003\n";
        ans += "\tmov     eax, dword [rbp-120H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-118H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmov     byte [rax], 0\n";
        ans += "\tmov     rax, qword [rbp-118H]\n";
        ans += "\tmov     rcx, qword [rbp-8H]\n";
        ans += "\txor     rcx, qword [fs:abs 28H]\n";
        ans += "\tjz      Lgs_005\n";
        ans += "\tcall    __stack_chk_fail\n";
        ans += "\tLgs_005:  leave\n";
        ans += "\tret\n";

        //string.substring
        ans += "string.substring:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tsub     rsp, 32\n";
        ans += "\tmov     qword [rbp-18H], rdi\n";
        ans += "\tmov     dword [rbp-1CH], esi\n";
        ans += "\tmov     dword [rbp-20H], edx\n";
        ans += "\tmov     edi, 256\n";
        ans += "\tcall    malloc\n";
        ans += "\tmov     qword [rbp-8H], rax\n";
        ans += "\tmov     eax, dword [rbp-20H]\n";
        ans += "\tsub     eax, dword [rbp-1CH]\n";
        ans += "\tadd     eax, 1\n";
        ans += "\tmov     dword [rbp-0CH], eax\n";
        ans += "\tmov     dword [rbp-10H], 0\n";
        ans += "\tjmp     Lsub_002\n";
        ans += "Lsub_001:  mov     eax, dword [rbp-10H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-8H]\n";
        ans += "\tadd     rdx, rax\n";
        ans += "\tmov     ecx, dword [rbp-10H]\n";
        ans += "\tmov     eax, dword [rbp-1CH]\n";
        ans += "\tadd     eax, ecx\n";
        ans += "\tmovsxd  rcx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rcx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tmov     byte [rdx], al\n";
        ans += "\tadd     dword [rbp-10H], 1\n";
        ans += "Lsub_002:  mov     eax, dword [rbp-10H]\n";
        ans += "\tcmp     eax, dword [rbp-0CH]\n";
        ans += "\tjl      Lsub_001\n";
        ans += "\tmov     eax, dword [rbp-0CH]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-8H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmov     byte [rax], 0\n";
        ans += "\tmov     rax, qword [rbp-8H]\n";
        ans += "\tleave\n";
        ans += "\t        ret\n";

        //parseInt
        ans += "parseInt:\n";
        ans += "\tpush    rbp\n";
        ans += "\tmov     rbp, rsp\n";
        ans += "\tsub     rsp, 32\n";
        ans += "\tmov     qword [rbp-18H], rdi\n";
        ans += "\tmov     edi, 256\n";
        ans += "\tcall    malloc\n";
        ans += "\tmov     qword [rbp-8H], rax\n";
        ans += "\tmov     dword [rbp-10H], 0\n";
        ans += "\tmov     dword [rbp-0CH], 0\n";
        ans += "\tjmp     Lpar_002\n";
        ans += "Lpar_001:  add     dword [rbp-10H], 1\n";
        ans += "Lpar_002:  mov     eax, dword [rbp-10H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\ttest    al, al\n";
        ans += "\tjz      Lpar_004\n";
        ans += "\tmov     eax, dword [rbp-10H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\ttest    al, al\n";
        ans += "\tjs      Lpar_001\n";
        ans += "\tmov     eax, dword [rbp-10H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tcmp     al, 57\n";
        ans += "\tjg      Lpar_001\n";
        ans += "\tjmp     Lpar_004\n";
        ans += "Lpar_003:  mov     edx, dword [rbp-0CH]\n";
        ans += "\tmov     eax, edx\n";
        ans += "\tshl     eax, 2\n";
        ans += "\tadd     eax, edx\n";
        ans += "\tadd     eax, eax\n";
        ans += "\tmov     ecx, eax\n";
        ans += "\tmov     eax, dword [rbp-10H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tmovsx   eax, al\n";
        ans += "\tadd     eax, ecx\n";
        ans += "\tsub     eax, 48\n";
        ans += "\tmov     dword [rbp-0CH], eax\n";
        ans += "\tadd     dword [rbp-10H], 1\n";
        ans += "Lpar_004:  mov     eax, dword [rbp-10H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tcmp     al, 47\n";
        ans += "\tjle     Lpar_005\n";
        ans += "\tmov     eax, dword [rbp-10H]\n";
        ans += "\tmovsxd  rdx, eax\n";
        ans += "\tmov     rax, qword [rbp-18H]\n";
        ans += "\tadd     rax, rdx\n";
        ans += "\tmovzx   eax, byte [rax]\n";
        ans += "\tcmp     al, 57\n";
        ans += "\tjle     Lpar_003\n";
        ans += "Lpar_005:  mov     eax, dword [rbp-0CH]\n";
        ans += "\tleave\n";
        ans += "\tret\n";
    }

}
