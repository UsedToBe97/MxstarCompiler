package ast.stmt;

import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

public class BreakStmt extends Stmt {
    public BreakStmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
    public void check() {
        if (GlobalClass.circnt == 0)
            throw new CompileError("No Cir to break(BreakStmt)", pos);
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "BreakStmt");
    }
}