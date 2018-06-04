package compiler;

import ast.definition.VarDef;
import ir.Func;
import ir.Ir;
import ir.inst.*;
import ir.operand.Operand;
import ir.operand.addr.GlobalAddr;
import ir.operand.addr.MemAddr;
import ir.operand.reg.Reg;
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

// U can set the rule on your own
// caller (when call) r8~10 rdi rsi
// callee (when enter func) r11~15 rbx
public class CodeGenerator {
    public Func nowfunc;
    public StringBuffer ans = new StringBuffer("");
    public int tot = 0;
    public void enterFunc() {
        ans.append("\tpush\trbp\n");
        ans.append("\tmov\trbp, rsp\n");
        tot = 0;
        if (nowfunc.opt) {
            for (int i = 0; i <= 3; ++i) {
                if (!nowfunc.tag[X86Reg.callee(i).idx]) continue;
                ans.append("\tpush\t" + X86Reg.callee(i).toString() + "\n");
                ++tot;
            }
        }
        if (tot > 0) ans.append("\tsub\trbp, " + Integer.toString(tot * 8) + "\n");
        if (nowfunc.size > 0) ans.append("\tsub\trsp, ").append(Integer.toString(nowfunc.size)).append("\n");
    }
    public void exitFunc() {
        if (nowfunc.size > 0) ans.append("\tadd\trsp, " + Integer.toString(nowfunc.size) + "\n");
        if (tot > 0) ans.append("\tadd\trbp, " + Integer.toString(tot * 8) + "\n");
        if (nowfunc.opt) {
            for (int i = 3; i >= 0; --i) {
                if (!nowfunc.tag[X86Reg.callee(i).idx]) continue;
                ans.append("\tpop\t" + X86Reg.callee(i).toString() + "\n");
            }
        }
        ans.append("\tmov\trsp, rbp\n");
        ans.append("\tpop\trbp\n");
        ans.append("\tret\n");
    }
    public void visit(Inst x) {x.accept(this);}

    public void A(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.rcx);
        dest = getOp(dest, X86Reg.rdx);
        if (lhs.toString().equals(dest.toString()) && dest instanceof Reg) {
            rhs = getOp(rhs, X86Reg.rcx);
            ans.append("\t" + op + "\t" + dest.toString() + ", " + rhs.toString() + "\n");
            return;
        }
        rhs = getOp(rhs, X86Reg.rax);
        if (!lhs.toString().equals("rcx")) {
            ans.append("\tmov\trcx, " + lhs.toString() + "\n");
        }
        ans.append("\t" + op + "\trcx, " + rhs.toString() + "\n");
        ans.append("\tmov\t" + dest.toString() + ", rcx\n");
    }

    public void B(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.rax);
        ans.append("\tmov\trcx, " + lhs.toString() + "\n");
        rhs = getOp(rhs, X86Reg.rbx);
        ans.append("\tcmp\trcx, " + rhs.toString() + "\n");
        dest = getOp(dest, X86Reg.rbx);
        ans.append("\t" + op + "\tcl\n\tmovzx\trcx, cl\n");
        ans.append("\tmov\t" + dest.toString() + ", rcx\n");
    }

    public void C(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.rax);
        rhs = getOp(rhs, X86Reg.rcx);
        dest = getOp(dest, X86Reg.rdx);
        ans.append("\tmov\trax, " + lhs.toString() + "\n");
        ans.append("\tmov\trcx, " + rhs.toString() + "\n");
        ans.append("\t" + op + "\trax, cl\n");
        ans.append("\tmov\t" + dest.toString() + ", rax\n");
    }

    public String JW(Operand lhs) {
        String tt = lhs.toString();
        if (lhs instanceof Reg) {
            if (tt.charAt(1) >= 'a' && tt.charAt(1) <= 'z') tt =  tt.replaceFirst("r", "e");
            else tt = tt + "d";
        }
        if (lhs instanceof MemAddr || lhs instanceof GlobalAddr) {
            tt =  tt.replaceFirst("qword", "dword");
        }
        return tt;
    }

    public void D(Operand dest, Operand lhs, Operand rhs, String op) {
        lhs = getOp(lhs, X86Reg.rax);
        rhs = getOp(rhs, X86Reg.rcx);
        dest = getOp(dest, X86Reg.rdx);
        String tt = JW(lhs);
        String tt2 = JW(dest);
        String tt3 = JW(rhs);
        ans.append("\tmov\tecx, " + tt3 + "\n");
        ans.append("\tmov\teax, " + tt + "\n");
        ans.append("\tcdq\n\tidiv\tecx\n");
        String src = op.equals("div") ? "eax" : "edx";
        ans.append("\tmov\t" + tt2 + ", " + src + "\n");
    }


    public void visit(Binop x) {
        if (x.del) {
            System.err.println("del");
            return;
        }
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
        if (x.del) {
            System.err.println("del");
            return;
        }
        int tmp = x.size > 6 ? (x.size - 6) * 8 : 0;

        if(tmp > 0) ans.append("\tsub\trsp, " + Integer.toString(tmp) + "\n");
        /*int cc = 5;
        if (nowfunc.opt) {
            for (Inst u : x.Insts)
                if (u instanceof FuncCall) {
                    if (((FuncCall) u).name.equals("toString")) {
                        cc = 4;
                    }
                    if (((FuncCall) u).name.equals("string.add")) {
                        cc = 4;
                    }
                }
        }*/

        if (nowfunc.opt) {
            for (int i = 0; i <= 5; ++i) {
                if (!nowfunc.tag[X86Reg.caller(i).idx]) continue;
                ans.append("\tpush\t" + X86Reg.caller(i).toString() + "\n");
            }
        }
        for (Inst u : x.Insts) {
            visit(u);
            if (u instanceof FuncCall && nowfunc.opt) {
                for (int i = 5; i >= 0; --i) {
                    if (!nowfunc.tag[X86Reg.caller(i).idx]) continue;
                    ans.append("\tpop\t" + X86Reg.caller(i).toString() + "\n");
                }
            }
        }
        if(tmp > 0) ans.append("\tadd\trsp, " + Integer.toString(tmp) + "\n");
    }

    public void visit(CJump x) {
        if (x.del) {
            System.err.println("del");
            return;
        }
        x.lhs = getOp(x.lhs, X86Reg.rcx);
        x.rhs = getOp(x.rhs, X86Reg.rdx);
        if (!(x.lhs instanceof Reg)) {
            ans.append("\tmov\trax, " + x.lhs.toString() + "\n");
            x.lhs = X86Reg.rax;
        }
        ans.append("\tcmp\t" + x.lhs.toString() + ", " + x.rhs.toString() +"\n");
        ans.append("\t" + x.op + "\t" + x.dest.name +"\n");
    }

    public void visit(FuncCall x) {
        if (x.del) {
            System.err.println("del");
            return;
        }
        ans.append("\tcall\t" + x.name + "\n");
    }

    public void visit(Label x) {
        ans.append(x.name + ":\n");
    }

    public void visit(Move x) {
        if (x.del) {
            System.err.println("del");
            return;
        }
        /*if (x.src instanceof INum) {
            x.dest = getOp(x.dest, X86Reg.rbx);
            ans.append("\tmov\t" + x.dest.toString() + ", " + x.src.toString() + "\n");
            return;
        }
        x.src = getOp(x.src, X86Reg.rax);
        if (!x.src.toString().equals("rax"))
            ans.append("\tmov\trax, " + x.src.toString() + "\n");


        x.dest = getOp(x.dest, X86Reg.rax);
        if (!x.dest.toString().equals("rax"))
            ans.append("\tmov\t" + x.dest.toString() + ", rax\n");*/
        if (x.src.toString().equals(x.dest.toString())) return;
        /*if (x.src instanceof VirtualReg && x.dest instanceof VirtualReg) {
            if (((VirtualReg) x.dest).idx == ((VirtualReg) x.src).idx) return;
        }*/
        x.dest = getOp(x.dest, X86Reg.rbx);
        x.src = getOp(x.src, X86Reg.rcx);
        if (!(x.dest instanceof Reg) && !(x.src instanceof Reg)) {
            ans.append("\tmov\trcx, " + x.src.toString() + "\n");
            x.src = X86Reg.rcx;
        }
        ans.append("\tmov\t" + x.dest.toString() + ", " + x.src.toString() + "\n");
    }

    public void visit(UnaryOp x) {
        if (x.del) {
            System.err.println("del");
            return;
        }
        x.src = getOp(x.src, X86Reg.rdx);
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
        if (x.del) {
            System.err.println("del");
            return;
        }
        ans.append("\tjmp\t" + x.label.name + "\n");
    }

    public Operand getOp(Operand x, Reg tmp) {
        if (x instanceof Reg) {
            if (((Reg)x).idx < 16) return X86Reg.get(((Reg)x).idx);
            else return new MemAddr(X86Reg.rbp, null, 0, -(((Reg)x).idx - 15) * 8);
        }
        if (x instanceof MemAddr) {
            Operand base = getOp(((MemAddr) x).base, null);
            Operand index = getOp(((MemAddr) x).index, null);

            if (base instanceof MemAddr || index instanceof MemAddr) {
                if (index != null) {
                    ans.append("\tmov\t" + tmp.name + ", " + index.toString() + "\n");
                    ans.append("\timul\t" + tmp.name + ", " + Integer.toString(((MemAddr) x).scale) + "\n");
                    ans.append("\tadd\t" + tmp.name + ", " + base.toString() +"\n");
                } else ans.append("\tmov\t" + tmp.name + ", " + base +"\n");
                return new MemAddr(tmp, null, 0, ((MemAddr) x).disp);
            } else
                if (base.toString().equals("rbp") && ((MemAddr) x).disp > 0)
                    ((MemAddr)x).disp += tot * 8;
                return new MemAddr((Reg)base, (Reg)index, ((MemAddr) x).scale, ((MemAddr) x).disp);
        }

        return x;
    }
    void translate(Ir rt) {
        int cc = 0;
        ans.append("global main\n\n");
        ans.append("extern puts\n");
        ans.append("extern getchar\n");
        ans.append("extern putchar\n");
        ans.append("extern sprintf\n");
        ans.append("extern __stack_chk_fail\n");
        ans.append("extern malloc\n");
        ans.append("extern printf\n");
        ans.append("extern strlen\n");
        ans.append("extern memcpy\n");
        ans.append("extern scanf\n");

        ans.append("section .data\n");
        for (String u : rt.SC) {
            ans.append("\tdq\t" + u.length() + "\nstr__" + Integer.toString(cc++) + ":\n\tdb\t");
            for (int i = 0; i < u.length(); ++i) ans.append(Integer.toString((int)u.charAt(i)) + ", ");
            ans.append("0\n");
        }
        for (String u : rt.SC2) {
            ans.append("\tdq\t500" + "\n" + u + ":\n\tdb\t");
            for (int i = 0; i < 500; ++i) ans.append(Integer.toString(0) + ", ");
            ans.append("0\n");
        }
        for (VarDef u : rt.GV) ans.append(u.name + ":\n\tdq\t0\n");
        ans.append("intbuffer:\n");
        ans.append("\tdq 0\n");
        ans.append("format1:\n");
        ans.append("\tdb\"%lld\",0\n");
        ans.append("format2:\n");
        ans.append("\tdb\"%s\",0\n\n");
        ans.append("section .bss\n");
        ans.append("stringbuffer:\n");
        ans.append("\tresb 256\n");

        ans.append("section .text\n");

        for (Func u : rt.Funcs) {
            nowfunc = u;
            int pp = 0;
            for (Reg p : nowfunc.Regs){
                if (pp < p.idx) pp = p.idx;
            }
            nowfunc.size = pp > 15 ? pp - 15 : 0;
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
        ans.append("\tpush rbp\n");
        ans.append("\tmov rbp,rsp\n");
        ans.append("\tmov rdx,rdi\n");
        ans.append("\tmov rax,0\n");
        ans.append("\tmov rdi,stringbuffer\n");
        ans.append("\tmov rsi,format1\n");
        ans.append("\tcall sprintf\n");
        ans.append("\tmov rdi,stringbuffer\n");
        ans.append("\tcall transtring\n");
        ans.append("\tmov rsp,rbp\n");
        ans.append("\tpop rbp\n");
        ans.append("\tret\n");


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
        ans.append("\tpush rbp\n");
        ans.append("\tmov rbp,rsp\n");
        ans.append("\tpush rsi\n");
        ans.append("\tmov rsi,rdi\n");
        ans.append("\tmov rdi,stringbuffer\n");
        ans.append("\tmov rdx,[rsi-8]\n");
        ans.append("\tpush rdx\n");
        ans.append("\tcall memcpy\n");
        ans.append("\tpop rdi\n");
        ans.append("\tpop rsi\n");
        ans.append("\tadd rdi,stringbuffer\n");
        ans.append("\tmov rdx,[rsi-8]\n");
        ans.append("\tadd rdx,1\n");
        ans.append("\tcall memcpy\n");
        ans.append("\tmov rdi,stringbuffer\n");
        ans.append("\tcall transtring\n");
        ans.append("\tmov rsp,rbp\n");
        ans.append("\tpop rbp\n");
        ans.append("\tret\n");




        //getInt
        ans.append("getInt:\n");
        ans.append("\tpush rbp\n");
        ans.append("\tmov rbp,rsp\n");
        ans.append("\tmov rax,0\n");
        ans.append("\tmov rdi,format1\n");
        ans.append("\tmov rsi,intbuffer\n");
        ans.append("\tcall scanf\n");
        ans.append("\tmov rax,[intbuffer]\n");
        ans.append("\tmov rsp,rbp\n");
        ans.append("\tpop rbp\n");
        ans.append("\tret\n");

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
        ans.append("\tpush rbp\n");
        ans.append("\tmov rbp,rsp\n");
        ans.append("\tmov rax,0\n");
        ans.append("\tmov rsi,rdi\n");
        ans.append("\tmov rdi,format2\n");
        ans.append("\tcall printf\n");
        ans.append("\tmov rsp,rbp\n");
        ans.append("\tpop rbp\n");
        ans.append("\tret\n");

        //getString
        ans.append("transtring:\n");
        ans.append("\n");
        ans.append("\tpush rbp\n");
        ans.append("\tmov rbp,rsp\n");
        ans.append("\tcall strlen\n");
        ans.append("\tpush rdi\n");
        ans.append("\tmov rdi,rax\n");
        ans.append("\tpush rdi\n");
        ans.append("\tadd rdi,9\n");
        ans.append("\tcall malloc\n");
        ans.append("\tpop rdi\n");
        ans.append("\tmov [rax],rdi\n");
        ans.append("\tadd rax,8\n");
        ans.append("\tmov rdx,rdi\n");
        ans.append("\tadd rdx,1\n");
        ans.append("\tmov rdi,rax\n");
        ans.append("\tpop rsi\n");
        ans.append("\tsub rsp,8\n");
        ans.append("\tpush rax\n");
        ans.append("\tcall memcpy\n");
        ans.append("\tpop rax\n");
        ans.append("\tmov rsp,rbp\n");
        ans.append("\tpop rbp\n");
        ans.append("\tret\n");
        ans.append("\n");
        ans.append("getString:\n");
        ans.append("\n");
        ans.append("\tpush rbp\n");
        ans.append("\tmov rbp,rsp\n");
        ans.append("\tmov rax,0\n");
        ans.append("\tmov rdi,format2\n");
        ans.append("\tmov rsi,stringbuffer\n");
        ans.append("\tcall scanf\n");
        ans.append("\tmov rdi,stringbuffer\n");
        ans.append("\tcall transtring\n");
        ans.append("\tmov rsp,rbp\n");
        ans.append("\tpop rbp\n");
        ans.append("\tret\n");
        ans.append("\n");

        //string.substring
        ans.append("string.substring:\n");
        ans.append("\tpush rbp\n");
        ans.append("\tmov rbp,rsp\n");
        ans.append("\tpush rdi\n");
        ans.append("\tpush rsi\n");
        ans.append("\tmov rdi,rdx\n");
        ans.append("\tsub rdi,rsi\n");
        ans.append("\tadd rdi,1\n");
        ans.append("\tpush rdi\n");
        ans.append("\tadd rdi,9\n");
        ans.append("\tcall malloc\n");
        ans.append("\tpop rdx\n");
        ans.append("\tmov [rax],rdx\n");
        ans.append("\tadd rax,8\n");
        ans.append("\tpop rsi\n");
        ans.append("\tpop rdi\n");
        ans.append("\tadd rsi,rdi\n");
        ans.append("\tmov rdi,rax\n");
        ans.append("\tpush rdx\n");
        ans.append("\tpush rax\n");
        ans.append("\tcall memcpy\n");
        ans.append("\tpop rax\n");
        ans.append("\tpop rdx\n");
        ans.append("\tmov qword[rax+rdx],0\n");
        ans.append("\tmov rsp,rbp\n");
        ans.append("\tpop rbp\n");
        ans.append("\tret\n");
        ans.append("\n");

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
