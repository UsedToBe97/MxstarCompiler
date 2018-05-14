package ast.stmt;

import ast.definition.ClassDef;
import ast.definition.Def;
import ast.definition.FuncDef;
import ast.definition.VarDef;
import compiler.IrBuilder;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class BlockStmt extends Stmt {
    public List<Stmt> Stmts;
    public BlockStmt(Position _pos) {
        Stmts = new LinkedList<>();
        pos = _pos;
    }
    public void add(Stmt _s) {Stmts.add(_s);}
    public Position getpos() {
        return pos;
    }

    public void check() {
        GlobalClass.st.enterScope();
        for (Stmt s : Stmts) {
            if (s instanceof Def) {
                if (s instanceof ClassDef || s instanceof FuncDef)
                    throw new CompileError("Can't define class or func here(BlockStmt)", pos);
                else if (s instanceof VarDef) s.check();
                else new CompileError("WTF(BlockStmt)", pos);
            } else if (s != null) s.check();
        }
        GlobalClass.st.exitScope();
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "BlockStmt:");
        for (Stmt st : Stmts) {
            if (st != null) st.output(dep + 1);
        }
        System.out.println(s + "EndBlockStmt:");
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}