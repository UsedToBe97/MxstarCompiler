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
    public StringBuffer ans = new StringBuffer("");

    public void enterFunc() {
        ans.append("\tpush\trbp\n");
        ans.append("\tmov\trbp, rsp\n");
        ans.append("\tsub\trsp, ").append(Integer.toString(nowfunc.size)).append("\n");
    }
    public void exitFunc() {
        //ans.append("\tadd\trsp, " + Integer.toString(nowfunc.size) + "\n");
        ans.append("\tmov\trsp, rbp\n");
        ans.append("\tpop\trbp\n");
        ans.append("\tret\n");
    }
    public void visit(Inst x) {x.accept(this);}

    public void A(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.r10);
        rhs = getOp(rhs, X86Reg.r11);
        dest = getOp(dest, X86Reg.r12);
        ans.append("\tmov\trdx, " + lhs.toString() + "\n");
        ans.append("\t" + op + "\trdx, " + rhs.toString() + "\n");
        ans.append("\tmov\t" + dest.toString() + ", rdx\n");
    }

    public void B(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.r10);
        rhs = getOp(rhs, X86Reg.r11);
        dest = getOp(dest, X86Reg.r12);
        ans.append("\tmov\trcx, " + lhs.toString() + "\n");
        ans.append("\tcmp\trcx, " + rhs.toString() + "\n");
        ans.append("\t" + op + "\tcl\n\tmovzx\trcx, cl\n");
        ans.append("\tmov\t" + dest.toString() + ", rcx\n");
    }

    public void C(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.r10);
        rhs = getOp(rhs, X86Reg.r11);
        dest = getOp(dest, X86Reg.r12);
        ans.append("\tmov\trax, " + lhs.toString() + "\n");
        ans.append("\tmov\trcx, " + rhs.toString() + "\n");
        ans.append("\t" + op + "\trax, cl\n");
        ans.append("\tmov\t" + dest.toString() + ", rax\n");
    }

    public void D(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.r10);
        rhs = getOp(rhs, X86Reg.r11);
        dest = getOp(dest, X86Reg.r12);
        ans.append("\tmov\trax, " + lhs.toString() + "\n");
        ans.append("\tmov\trcx, " + rhs.toString() + "\n");
        ans.append("\tcqo\n\tidiv\trcx\n");
        String src = op.equals("div") ? "rax" : "rdx";
        ans.append("\tmov\t" + dest.toString() + ", " + src + "\n");
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
        int tmp = x.size > 6 ? (x.size - 6) * 8 : 0;
        if(tmp != 0) ans.append("\tsub\trsp, " + Integer.toString(tmp) + "\n");
        for (Inst u : x.Insts) visit(u);
    }

    public void visit(CJump x) {
        x.lhs = getOp(x.lhs, X86Reg.r10);
        x.rhs = getOp(x.rhs, X86Reg.r11);
        ans.append("\tcmp\t" + x.lhs.toString() + ", " + x.rhs.toString() +"\n");
        ans.append("\t" + x.op + "\t" + x.dest.name +"\n");
    }

    public void visit(FuncCall x) {
        ans.append("\tcall\t" + x.name + "\n");
    }

    public void visit(Label x) {
        ans.append(x.name + ":\n");
    }

    public void visit(Move x) {
        x.src = getOp(x.src, X86Reg.rbx);
        if (!x.src.toString().equals("rax"))
            ans.append("\tmov\trax, " + x.src.toString() + "\n");


        x.dest = getOp(x.dest, X86Reg.rbx);
        if (!x.dest.toString().equals("rax"))
            ans.append("\tmov\t" + x.dest.toString() + ", rax\n");
    }

    public void visit(UnaryOp x) {
        x.src = getOp(x.src, X86Reg.rbx);
        if (x.op.equals("~")) {
            ans.append("\tnot\t" + x.src.toString() + "\n");
        }
        if (x.op.equals("!")) {
            ans.append("\txor\t" + x.src.toString() + ", 1\n");
        }
        if (x.op.equals("-")) {
            ans.append("\tneg\t" + x.src.toString() + "\n");
        }
    }

    public void visit(Jump x) {
        ans.append("\tjmp\t" + x.label.name + "\n");
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
                    ans.append("\tmov\t" + tmp.name + ", " + index.toString() + "\n");
                    ans.append("\timul\t" + tmp.name + ", " + Integer.toString(((MemAddr) x).scale) + "\n");
                    ans.append("\tadd\t" + tmp.name + ", " + base.toString() +"\n");
                } else ans.append("\tmov\t" + tmp.name + ", " + base +"\n");
                return new MemAddr(tmp, null, 0, ((MemAddr) x).disp);
            }
        }

        return x;
    }
    void translate(Ir rt) {
        int cc = 0;
        ans.append("global main\n\n");
        ans.append("extern puts\n");
        ans.append("extern getchar\n");
        ans.append("extern putchar\n");
        ans.append("extern __stack_chk_fail\n");
        ans.append("extern malloc\n");
        ans.append("extern printf\n");
        ans.append("extern gets\n");
        ans.append("extern __isoc99_scanf\n");

        ans.append("section .data\n");
        for (String u : rt.SC) {
            ans.append("\tdq\t" + u.length() + "\nstr__" + Integer.toString(cc++) + ":\n\tdb\t");
            for (int i = 0; i < u.length(); ++i) ans.append(Integer.toString((int)u.charAt(i)) + ", ");
            ans.append("0\n");
        }
        for (VarDef u : rt.GV) ans.append(u.name + ":\n\tdq\t0\n");


        ans.append("section .text\n");

        for (Func u : rt.Funcs) {
            nowfunc = u;
            int pp = 0;
            for (Reg p : nowfunc.Regs){
                if (pp < p.idx) pp = p.idx;
            }
            nowfunc.size = pp > 16 ? pp - 16 : 0;
            //nowfunc.size = nowfunc.num > 16 ? nowfunc.num - 16 : 0;
            nowfunc.size *= 8;
            ans.append(nowfunc.name + ":\n");
            enterFunc();
            for (Inst v : u.Insts) visit(v);
            exitFunc();
        }
        Builtin();
    }
    public void Builtin() {
        //toString
        ans.append("toString:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tsub     rsp, 1088\n");
        ans.append("\tmov     dword [rbp-434H], edi\n");
        ans.append("\tmov     rax, qword [fs:abs 28H]\n");
        ans.append("\tmov     qword [rbp-8H], rax\n");
        ans.append("\txor     eax, eax\n");
        ans.append("\tmov     edi, 256\n");
        ans.append("\tcall    malloc\n");
        ans.append("\tmov     qword [rbp-418H], rax\n");
        ans.append("\tmov     dword [rbp-424H], 0\n");
        ans.append("\tcmp     dword [rbp-434H], 0\n");
        ans.append("\tjnz     L_001\n");
        ans.append("\tmov     rax, qword [rbp-418H]\n");
        ans.append("\tmov     byte [rax], 48\n");
        ans.append("\tmov     rax, qword [rbp-418H]\n");
        ans.append("\tadd     rax, 1\n");
        ans.append("\tmov     byte [rax], 0\n");
        ans.append("\tmov     rax, qword [rbp-418H]\n");
        ans.append("\tjmp     L_007\n");
        ans.append("L_001:  cmp     dword [rbp-434H], 0\n");
        ans.append("\tjns     L_002\n");
        ans.append("\tmov     rax, qword [rbp-418H]\n");
        ans.append("\tmov     byte [rax], 45\n");
        ans.append("\tneg     dword [rbp-434H]\n");
        ans.append("\tmov     dword [rbp-424H], 1\n");
        ans.append("L_002:  mov     dword [rbp-420H], 0\n");
        ans.append("\tjmp     L_004\n");
        ans.append("L_003:  mov     esi, dword [rbp-420H]\n");
        ans.append("\tlea     eax, [rsi+1H]\n");
        ans.append("\tmov     dword [rbp-420H], eax\n");
        ans.append("\tmov     ecx, dword [rbp-434H]\n");
        ans.append("\tmov     edx, 1717986919\n");
        ans.append("\tmov     eax, ecx\n");
        ans.append("\timul    edx\n");
        ans.append("\tsar     edx, 2\n");
        ans.append("\tmov     eax, ecx\n");
        ans.append("\tsar     eax, 31\n");
        ans.append("\tsub     edx, eax\n");
        ans.append("\tmov     eax, edx\n");
        ans.append("\tshl     eax, 2\n");
        ans.append("\tadd     eax, edx\n");
        ans.append("\tadd     eax, eax\n");
        ans.append("\tsub     ecx, eax\n");
        ans.append("\tmov     edx, ecx\n");
        ans.append("\tmovsxd  rax, esi\n");
        ans.append("\tmov     dword [rbp+rax*4-410H], edx\n");
        ans.append("\tmov     ecx, dword [rbp-434H]\n");
        ans.append("\tmov     edx, 1717986919\n");
        ans.append("\tmov     eax, ecx\n");
        ans.append("\timul    edx\n");
        ans.append("\tsar     edx, 2\n");
        ans.append("\tmov     eax, ecx\n");
        ans.append("\tsar     eax, 31\n");
        ans.append("\tsub     edx, eax\n");
        ans.append("\tmov     eax, edx\n");
        ans.append("\tmov     dword [rbp-434H], eax\n");
        ans.append("L_004:  cmp     dword [rbp-434H], 0\n");
        ans.append("\tjnz     L_003\n");
        ans.append("\tmov     dword [rbp-41CH], 0\n");
        ans.append("\tjmp     L_006\n");
        ans.append("L_005:  mov     edx, dword [rbp-424H]\n");
        ans.append("\tmov     eax, dword [rbp-41CH]\n");
        ans.append("\tadd     eax, edx\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-418H]\n");
        ans.append("\tadd     rdx, rax\n");
        ans.append("\tmov     eax, dword [rbp-420H]\n");
        ans.append("\tsub     eax, 1\n");
        ans.append("\tsub     eax, dword [rbp-41CH]\n");
        ans.append("\tcdqe\n");
        ans.append("\tmov     eax, dword [rbp+rax*4-410H]\n");
        ans.append("\tadd     eax, 48\n");
        ans.append("\tmov     byte [rdx], al\n");
        ans.append("\tadd     dword [rbp-41CH], 1\n");
        ans.append("L_006:  mov     eax, dword [rbp-41CH]\n");
        ans.append("\tcmp     eax, dword [rbp-420H]\n");
        ans.append("\tjl      L_005\n");
        ans.append("\tmov     edx, dword [rbp-424H]\n");
        ans.append("\tmov     eax, dword [rbp-420H]\n");
        ans.append("\tadd     eax, edx\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-418H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmov     byte [rax], 0\n");
        ans.append("\tmov     rax, qword [rbp-418H]\n");
        ans.append("L_007:  mov     rdi, qword [rbp-8H]\n");
        ans.append("\txor     rdi, qword [fs:abs 28H]\n");
        ans.append("\tjz      L_008\n");
        ans.append("\tcall    __stack_chk_fail\n");
        ans.append("L_008:  leave\n");
        ans.append("\t        ret\n");


        //println
        ans.append("println:\n");
        ans.append("\tcall puts\n");
        ans.append("\tret\n\n");

        //array.size
        ans.append("array.size:\n");
        ans.append("\tmov\trax, qword [rdi - 8]\n");
        ans.append("\tret\n\n");

        //string.add
        ans.append("string.add:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tsub     rsp, 48\n");
        ans.append("\tmov     qword [rbp-28H], rdi\n");
        ans.append("\tmov     qword [rbp-30H], rsi\n");
        ans.append("\tmov     edi, 256\n");
        ans.append("\tcall    malloc\n");
        ans.append("\tmov     qword [rbp-8H], rax\n");
        ans.append("\tmov     dword [rbp-14H], 0\n");
        ans.append("\tmov     dword [rbp-10H], 0\n");
        ans.append("\tjmp     Ladd_002\n");
        ans.append("Ladd_001:  add     dword [rbp-14H], 1\n");
        ans.append("Ladd_002:  mov     eax, dword [rbp-14H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-28H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjnz     Ladd_001\n");
        ans.append("\tjmp     Ladd_004\n");
        ans.append("Ladd_003:  add     dword [rbp-10H], 1\n");
        ans.append("Ladd_004:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-30H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjnz     Ladd_003\n");
        ans.append("\tmov     dword [rbp-0CH], 0\n");
        ans.append("\tjmp     Ladd_006\n");
        ans.append("Ladd_005:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-8H]\n");
        ans.append("\tadd     rdx, rax\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-28H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tmov     byte [rdx], al\n");
        ans.append("\tadd     dword [rbp-0CH], 1\n");
        ans.append("Ladd_006:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tcmp     eax, dword [rbp-14H]\n");
        ans.append("\tjl      Ladd_005\n");
        ans.append("\tmov     eax, dword [rbp-14H]\n");
        ans.append("\tmov     dword [rbp-0CH], eax\n");
        ans.append("\tjmp     Ladd_008\n");
        ans.append("Ladd_007:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-8H]\n");
        ans.append("\tadd     rdx, rax\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tsub     eax, dword [rbp-14H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-30H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tmov     byte [rdx], al\n");
        ans.append("\tadd     dword [rbp-0CH], 1\n");
        ans.append("Ladd_008:  mov     edx, dword [rbp-14H]\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tadd     eax, edx\n");
        ans.append("\tcmp     eax, dword [rbp-0CH]\n");
        ans.append("\tjg      Ladd_007\n");
        ans.append("\tmov     edx, dword [rbp-14H]\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tadd     eax, edx\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-8H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmov     byte [rax], 0\n");
        ans.append("\tmov     rax, qword [rbp-8H]\n");
        ans.append("\tleave\n");
        ans.append("\t        ret\n");

        //getInt
        ans.append("getInt:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tsub     rsp, 16\n");
        ans.append("\tcall    getchar\n");
        ans.append("\tmov     byte [rbp-5H], al\n");
        ans.append("\tmov     dword [rbp-4H], 0\n");
        ans.append("\tjmp     Lint_002\n");
        ans.append("Lint_001:  mov     edx, dword [rbp-4H]\n");
        ans.append("\tmov     eax, edx\n");
        ans.append("\tshl     eax, 2\n");
        ans.append("\tadd     eax, edx\n");
        ans.append("\tadd     eax, eax\n");
        ans.append("\tmov     edx, eax\n");
        ans.append("\tmovsx   eax, byte [rbp-5H]\n");
        ans.append("\tadd     eax, edx\n");
        ans.append("\tsub     eax, 48\n");
        ans.append("\tmov     dword [rbp-4H], eax\n");
        ans.append("\tcall    getchar\n");
        ans.append("\tmov     byte [rbp-5H], al\n");
        ans.append("Lint_002:  cmp     byte [rbp-5H], 47\n");
        ans.append("\tjle     Lint_003\n");
        ans.append("\tcmp     byte [rbp-5H], 57\n");
        ans.append("\tjle     Lint_001\n");
        ans.append("Lint_003:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tleave\n");
        ans.append("\t        ret\n");

        //string.length
        ans.append("string.length:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     dword [rbp-4H], 0\n");
        ans.append("\tjmp     Llen_002\n");
        ans.append("Llen_001:  add     dword [rbp-4H], 1\n");
        ans.append("Llen_002:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjnz     Llen_001\n");
        ans.append("\tmov     eax, dword [rbp-4H]\n");
        ans.append("\tpop     rbp\n");
        ans.append("\tret\n");

        //string.ord
        ans.append("string.ord:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     dword [rbp-1CH], esi\n");
        ans.append("\tmov     eax, dword [rbp-1CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tmovsx   eax, al\n");
        ans.append("\tmov     dword [rbp-4H], eax\n");
        ans.append("\tmov     eax, dword [rbp-4H]\n");
        ans.append("\tpop     rbp\n");
        ans.append("\tret\n");

        //print
        ans.append("print:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tsub     rsp, 32\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tjmp     Lprt_002\n");
        ans.append("Lprt_001:  add     dword [rbp-8H], 1\n");
        ans.append("Lprt_002:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjnz     Lprt_001\n");
        ans.append("\tmov     dword [rbp-4H], 0\n");
        ans.append("\tjmp     Lprt_010\n");
        ans.append("Lprt_003:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 92\n");
        ans.append("\tjne     Lprt_008\n");
        ans.append("\tmov     eax, dword [rbp-4H]\n");
        ans.append("\tadd     eax, 1\n");
        ans.append("\tcmp     eax, dword [rbp-8H]\n");
        ans.append("\tjge     Lprt_008\n");
        ans.append("\tmov     eax, dword [rbp-4H]\n");
        ans.append("\tcdqe\n");
        ans.append("\tlea     rdx, [rax+1H]\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 110\n");
        ans.append("\tjnz     Lprt_004\n");
        ans.append("\tmov     edi, 10\n");
        ans.append("\tcall    putchar\n");
        ans.append("\tadd     dword [rbp-4H], 1\n");
        ans.append("\tjmp     Lprt_009\n");
        ans.append("Lprt_004:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tcdqe\n");
        ans.append("\tlea     rdx, [rax+1H]\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 116\n");
        ans.append("\tjnz     Lprt_005\n");
        ans.append("\tmov     edi, 9\n");
        ans.append("\tcall    putchar\n");
        ans.append("\tadd     dword [rbp-4H], 1\n");
        ans.append("\tjmp     Lprt_009\n");
        ans.append("Lprt_005:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tcdqe\n");
        ans.append("\tlea     rdx, [rax+1H]\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 92\n");
        ans.append("\tjnz     Lprt_006\n");
        ans.append("\tmov     edi, 92\n");
        ans.append("\tcall    putchar\n");
        ans.append("\tadd     dword [rbp-4H], 1\n");
        ans.append("\tjmp     Lprt_009\n");
        ans.append("Lprt_006:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tcdqe\n");
        ans.append("\tlea     rdx, [rax+1H]\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 34\n");
        ans.append("\tjnz     Lprt_007\n");
        ans.append("\tmov     edi, 34\n");
        ans.append("\tcall    putchar\n");
        ans.append("\tadd     dword [rbp-4H], 1\n");
        ans.append("\tjmp     Lprt_009\n");
        ans.append("Lprt_007:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tmovsx   eax, al\n");
        ans.append("\tmov     edi, eax\n");
        ans.append("\tcall    putchar\n");
        ans.append("\tjmp     Lprt_009\n");
        ans.append("Lprt_008:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tmovsx   eax, al\n");
        ans.append("\tmov     edi, eax\n");
        ans.append("\tcall    putchar\n");
        ans.append("Lprt_009:  add     dword [rbp-4H], 1\n");
        ans.append("Lprt_010:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjne     Lprt_003\n");
        ans.append("\tnop\n");
        ans.append("\t        leave\n");
        ans.append("\tret\n");

        //getString
        ans.append("getString:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tsub     rsp, 288\n");
        ans.append("\tmov     rax, qword [fs:abs 28H]\n");
        ans.append("\tmov     qword [rbp-8H], rax\n");
        ans.append("\txor     eax, eax\n");
        ans.append("\tlea     rax, [rbp-110H]\n");
        ans.append("\tmov     rdi, rax\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tcall    gets\n");
        ans.append("\tmov     edi, 256\n");
        ans.append("\tcall    malloc\n");
        ans.append("\tmov     qword [rbp-118H], rax\n");
        ans.append("\tmov     dword [rbp-120H], 0\n");
        ans.append("\tjmp     Lgs_002\n");
        ans.append("Lgs_001:  add     dword [rbp-120H], 1\n");
        ans.append("Lgs_002:  mov     eax, dword [rbp-120H]\n");
        ans.append("\tcdqe\n");
        ans.append("\tmovzx   eax, byte [rbp+rax-110H]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjnz     Lgs_001\n");
        ans.append("\tmov     dword [rbp-11CH], 0\n");
        ans.append("\tmov     dword [rbp-11CH], 0\n");
        ans.append("\tjmp     Lgs_004\n");
        ans.append("Lgs_003:  mov     eax, dword [rbp-11CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-118H]\n");
        ans.append("\tadd     rdx, rax\n");
        ans.append("\tmov     eax, dword [rbp-11CH]\n");
        ans.append("\tcdqe\n");
        ans.append("\tmovzx   eax, byte [rbp+rax-110H]\n");
        ans.append("\tmov     byte [rdx], al\n");
        ans.append("\tadd     dword [rbp-11CH], 1\n");
        ans.append("Lgs_004:  mov     eax, dword [rbp-11CH]\n");
        ans.append("\tcmp     eax, dword [rbp-120H]\n");
        ans.append("\tjl      Lgs_003\n");
        ans.append("\tmov     eax, dword [rbp-120H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-118H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmov     byte [rax], 0\n");
        ans.append("\tmov     rax, qword [rbp-118H]\n");
        ans.append("\tmov     rcx, qword [rbp-8H]\n");
        ans.append("\txor     rcx, qword [fs:abs 28H]\n");
        ans.append("\tjz      Lgs_005\n");
        ans.append("\tcall    __stack_chk_fail\n");
        ans.append("\tLgs_005:  leave\n");
        ans.append("\tret\n");

        //string.substring
        ans.append("string.substring:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tsub     rsp, 32\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     dword [rbp-1CH], esi\n");
        ans.append("\tmov     dword [rbp-20H], edx\n");
        ans.append("\tmov     edi, 256\n");
        ans.append("\tcall    malloc\n");
        ans.append("\tmov     qword [rbp-8H], rax\n");
        ans.append("\tmov     eax, dword [rbp-20H]\n");
        ans.append("\tsub     eax, dword [rbp-1CH]\n");
        ans.append("\tadd     eax, 1\n");
        ans.append("\tmov     dword [rbp-0CH], eax\n");
        ans.append("\tmov     dword [rbp-10H], 0\n");
        ans.append("\tjmp     Lsub_002\n");
        ans.append("Lsub_001:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-8H]\n");
        ans.append("\tadd     rdx, rax\n");
        ans.append("\tmov     ecx, dword [rbp-10H]\n");
        ans.append("\tmov     eax, dword [rbp-1CH]\n");
        ans.append("\tadd     eax, ecx\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tmov     byte [rdx], al\n");
        ans.append("\tadd     dword [rbp-10H], 1\n");
        ans.append("Lsub_002:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tcmp     eax, dword [rbp-0CH]\n");
        ans.append("\tjl      Lsub_001\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-8H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmov     byte [rax], 0\n");
        ans.append("\tmov     rax, qword [rbp-8H]\n");
        ans.append("\tleave\n");
        ans.append("\t        ret\n");

        //string.parseInt
        ans.append("string.parseInt:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tsub     rsp, 32\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     edi, 256\n");
        ans.append("\tcall    malloc\n");
        ans.append("\tmov     qword [rbp-8H], rax\n");
        ans.append("\tmov     dword [rbp-10H], 0\n");
        ans.append("\tmov     dword [rbp-0CH], 0\n");
        ans.append("\tjmp     Lpar_002\n");
        ans.append("Lpar_001:  add     dword [rbp-10H], 1\n");
        ans.append("Lpar_002:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Lpar_004\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Lpar_001\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Lpar_001\n");
        ans.append("\tjmp     Lpar_004\n");
        ans.append("Lpar_003:  mov     edx, dword [rbp-0CH]\n");
        ans.append("\tmov     eax, edx\n");
        ans.append("\tshl     eax, 2\n");
        ans.append("\tadd     eax, edx\n");
        ans.append("\tadd     eax, eax\n");
        ans.append("\tmov     ecx, eax\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tmovsx   eax, al\n");
        ans.append("\tadd     eax, ecx\n");
        ans.append("\tsub     eax, 48\n");
        ans.append("\tmov     dword [rbp-0CH], eax\n");
        ans.append("\tadd     dword [rbp-10H], 1\n");
        ans.append("Lpar_004:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 47\n");
        ans.append("\tjle     Lpar_005\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjle     Lpar_003\n");
        ans.append("Lpar_005:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tleave\n");
        ans.append("\tret\n");

        //string.eq
        ans.append("\tstring.eq:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     qword [rbp-20H], rsi\n");
        ans.append("\tmov     dword [rbp-0CH], 0\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tjmp     Leq_002\n");
        ans.append("Leq_001:  add     dword [rbp-0CH], 1\n");
        ans.append("Leq_002:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Leq_004\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Leq_001\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Leq_001\n");
        ans.append("\tjmp     Leq_004\n");
        ans.append("Leq_003:  add     dword [rbp-8H], 1\n");
        ans.append("Leq_004:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Leq_005\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Leq_003\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Leq_003\n");
        ans.append("Leq_005:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tcmp     eax, dword [rbp-8H]\n");
        ans.append("\tjz      Leq_006\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Leq_010\n");
        ans.append("Leq_006:  mov     dword [rbp-4H], 0\n");
        ans.append("\tmov     dword [rbp-4H], 0\n");
        ans.append("\tjmp     Leq_009\n");
        ans.append("Leq_007:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-4H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjz      Leq_008\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Leq_010\n");
        ans.append("Leq_008:  add     dword [rbp-4H], 1\n");
        ans.append("Leq_009:  mov     eax, dword [rbp-4H]\n");
        ans.append("\tcmp     eax, dword [rbp-0CH]\n");
        ans.append("\tjl      Leq_007\n");
        ans.append("\tmov     eax, 1\n");
        ans.append("Leq_010:  pop     rbp\n");
        ans.append("\tret\n");

        //string.s
        ans.append("string.s:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     qword [rbp-20H], rsi\n");
        ans.append("\tmov     dword [rbp-10H], 0\n");
        ans.append("\tmov     dword [rbp-0CH], 0\n");
        ans.append("\tjmp     Ll_012\n");
        ans.append("Ll_011:  add     dword [rbp-10H], 1\n");
        ans.append("Ll_012:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Ll_014\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Ll_011\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Ll_011\n");
        ans.append("\tjmp     Ll_014\n");
        ans.append("Ll_013:  add     dword [rbp-0CH], 1\n");
        ans.append("Ll_014:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Ll_015\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Ll_013\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Ll_013\n");
        ans.append("Ll_015:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tcmp     dword [rbp-10H], eax\n");
        ans.append("\tcmovle  eax, dword [rbp-10H]\n");
        ans.append("\tmov     dword [rbp-4H], eax\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tjmp     Ll_019\n");
        ans.append("Ll_016:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjge     Ll_017\n");
        ans.append("\tmov     eax, 1\n");
        ans.append("\tjmp     Ll_021\n");
        ans.append("Ll_017:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjle     Ll_018\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Ll_021\n");
        ans.append("Ll_018:  add     dword [rbp-8H], 1\n");
        ans.append("Ll_019:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tcmp     eax, dword [rbp-4H]\n");
        ans.append("\tjl      Ll_016\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tcmp     eax, dword [rbp-0CH]\n");
        ans.append("\tjl      Ll_020\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Ll_021\n");
        ans.append("Ll_020:  mov     eax, 1\n");
        ans.append("Ll_021:  pop     rbp\n");
        ans.append("\tret\n");

        //string.g
        ans.append("string.g:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     qword [rbp-20H], rsi\n");
        ans.append("\tmov     dword [rbp-10H], 0\n");
        ans.append("\tmov     dword [rbp-0CH], 0\n");
        ans.append("\tjmp     Lg_023\n");
        ans.append("Lg_022:  add     dword [rbp-10H], 1\n");
        ans.append("Lg_023:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Lg_025\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Lg_022\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Lg_022\n");
        ans.append("\tjmp     Lg_025\n");
        ans.append("Lg_024:  add     dword [rbp-0CH], 1\n");
        ans.append("Lg_025:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Lg_026\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Lg_024\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Lg_024\n");
        ans.append("Lg_026:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tcmp     dword [rbp-10H], eax\n");
        ans.append("\tcmovle  eax, dword [rbp-10H]\n");
        ans.append("\tmov     dword [rbp-4H], eax\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tjmp     Lg_030\n");
        ans.append("Lg_027:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjle     Lg_028\n");
        ans.append("\tmov     eax, 1\n");
        ans.append("\tjmp     Lg_032\n");
        ans.append("Lg_028:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjge     Lg_029\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Lg_032\n");
        ans.append("Lg_029:  add     dword [rbp-8H], 1\n");
        ans.append("Lg_030:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tcmp     eax, dword [rbp-4H]\n");
        ans.append("\tjl      Lg_027\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tcmp     eax, dword [rbp-0CH]\n");
        ans.append("\tjg      Lg_031\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Lg_032\n");
        ans.append("Lg_031:  mov     eax, 1\n");
        ans.append("Lg_032:  pop     rbp\n");
        ans.append("\tret\n");

        //string.le
        ans.append("\tstring.le:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     qword [rbp-20H], rsi\n");
        ans.append("\tmov     dword [rbp-10H], 0\n");
        ans.append("\tmov     dword [rbp-0CH], 0\n");
        ans.append("\tjmp     Llege_002\n");
        ans.append("Llege_001:  add     dword [rbp-10H], 1\n");
        ans.append("Llege_002:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Llege_004\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Llege_001\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Llege_001\n");
        ans.append("\tjmp     Llege_004\n");
        ans.append("Llege_003:  add     dword [rbp-0CH], 1\n");
        ans.append("Llege_004:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Llege_005\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Llege_003\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Llege_003\n");
        ans.append("Llege_005:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tcmp     dword [rbp-10H], eax\n");
        ans.append("\tcmovle  eax, dword [rbp-10H]\n");
        ans.append("\tmov     dword [rbp-4H], eax\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tjmp     Llege_009\n");
        ans.append("Llege_006:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjge     Llege_007\n");
        ans.append("\tmov     eax, 1\n");
        ans.append("\tjmp     Llege_011\n");
        ans.append("Llege_007:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjle     Llege_008\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Llege_011\n");
        ans.append("Llege_008:  add     dword [rbp-8H], 1\n");
        ans.append("Llege_009:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tcmp     eax, dword [rbp-4H]\n");
        ans.append("\tjl      Llege_006\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tcmp     eax, dword [rbp-0CH]\n");
        ans.append("\tjle     Llege_010\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Llege_011\n");
        ans.append("\tLlege_010:  mov     eax, 1\n");
        ans.append("\tLlege_011:  pop     rbp\n");
        ans.append("\tret\n");

        //string.ge
        ans.append("\tstring.ge:\n");
        ans.append("\tpush    rbp\n");
        ans.append("\tmov     rbp, rsp\n");
        ans.append("\tmov     qword [rbp-18H], rdi\n");
        ans.append("\tmov     qword [rbp-20H], rsi\n");
        ans.append("\tmov     dword [rbp-10H], 0\n");
        ans.append("\tmov     dword [rbp-0CH], 0\n");
        ans.append("\tjmp     Llege_013\n");
        ans.append("Llege_012:  add     dword [rbp-10H], 1\n");
        ans.append("Llege_013:  mov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Llege_015\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Llege_012\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Llege_012\n");
        ans.append("\tjmp     Llege_015\n");
        ans.append("Llege_014:  add     dword [rbp-0CH], 1\n");
        ans.append("Llege_015:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjz      Llege_016\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\ttest    al, al\n");
        ans.append("\tjs      Llege_014\n");
        ans.append("\tmov     eax, dword [rbp-0CH]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     al, 57\n");
        ans.append("\tjg      Llege_014\n");
        ans.append("Llege_016:  mov     eax, dword [rbp-0CH]\n");
        ans.append("\tcmp     dword [rbp-10H], eax\n");
        ans.append("\tcmovle  eax, dword [rbp-10H]\n");
        ans.append("\tmov     dword [rbp-4H], eax\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tmov     dword [rbp-8H], 0\n");
        ans.append("\tjmp     Llege_020\n");
        ans.append("Llege_017:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjle     Llege_018\n");
        ans.append("\tmov     eax, 1\n");
        ans.append("\tjmp     Llege_022\n");
        ans.append("Llege_018:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rdx, eax\n");
        ans.append("\tmov     rax, qword [rbp-18H]\n");
        ans.append("\tadd     rax, rdx\n");
        ans.append("\tmovzx   edx, byte [rax]\n");
        ans.append("\tmov     eax, dword [rbp-8H]\n");
        ans.append("\tmovsxd  rcx, eax\n");
        ans.append("\tmov     rax, qword [rbp-20H]\n");
        ans.append("\tadd     rax, rcx\n");
        ans.append("\tmovzx   eax, byte [rax]\n");
        ans.append("\tcmp     dl, al\n");
        ans.append("\tjge     Llege_019\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Llege_022\n");
        ans.append("Llege_019:  add     dword [rbp-8H], 1\n");
        ans.append("Llege_020:  mov     eax, dword [rbp-8H]\n");
        ans.append("\tcmp     eax, dword [rbp-4H]\n");
        ans.append("\tjl      Llege_017\n");
        ans.append("\tmov     eax, dword [rbp-10H]\n");
        ans.append("\tcmp     eax, dword [rbp-0CH]\n");
        ans.append("\tjge     Llege_021\n");
        ans.append("\tmov     eax, 0\n");
        ans.append("\tjmp     Llege_022\n");
        ans.append("Llege_021:  mov     eax, 1\n");
        ans.append("Llege_022:  pop     rbp\n");
        ans.append("\tret\n");
    }

}
