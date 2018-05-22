package compiler;

import ir.Func;
import ir.Ir;
import ir.inst.*;

public class CodeGenerator {
    Func nowfunc;
    String ans = "";
    String translate(Ir rt) {
        ans += "global main\n\n";
        ans += "section .text\n";
        for (Func u : rt.Funcs) {
            nowfunc.size = nowfunc.num > 16 ? nowfunc.num - 16 : 0;
            enterFunc();
            for (Inst v : u.Insts) visit(v);
            exitFunc();
        }
        return ans;
    }
    public void enterFunc() {
        ans += "\tpush\trbp\n";
        ans += "\tmov\trbp, rsp\n";
        ans += "\tsub\trsp, " + Integer.toString(nowfunc.size) + "\n";
    }
    public void exitFunc() {
        ans += "\tadd\trsp, " + Integer.toString(nowfunc.size) + "\n";
        ans += "\tmov\trsp, rbp\n";
        ans += "\tpop\trbp\n";
        ans += "\tret\n";
    }
    public void visit(Inst x) {x.accept(this);}
    public void visit(Binop x) {}
    public void visit(Call x) {}
    public void visit(CJump x) {}
    public void visit(FuncCall x) {}
    public void visit(Label x) {}
    public void visit(Move x) {}
    public void visit(UnaryOp x) {}
    //public Operand getOp(Operand) {}
}
