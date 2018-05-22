package ast.stmt;

import ast.expr.Expr;
import ast.type.NullType;
import ast.type.Type;
import ast.type.VoidType;
import compiler.IrBuilder;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.Objects;

public class ReturnStmt extends Stmt {
    public Expr expr;
    public Type type = null;
    public ReturnStmt(Expr _e, Position _p) {
        pos = _p;
        expr = _e;
    }
    public ReturnStmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
    public void check() {
        if (!GlobalClass.infunc)
            throw new CompileError("Can't Return(ReturnStmt)", pos);
        //System.err.println(expr.gettype().typename() + "     " + GlobalClass.nowfunc.type.typename());
        if (expr == null){
            if (GlobalClass.nowfunc.type instanceof VoidType) {
                type = new VoidType(pos);
                return;
            } else if (GlobalClass.nowfunc.type instanceof NullType) {
                type = new NullType(pos);
                return;
            }else throw new CompileError("Type Now Match(ReturnStmt)", pos);
        } else if (!Objects.equals(expr.gettype().typename(), GlobalClass.nowfunc.type.typename())
                && !(expr.gettype() instanceof NullType))
            throw new CompileError("Type Now Match(ReturnStmt)", pos);
        else if (Objects.equals(expr.gettype().typename(), GlobalClass.nowfunc.type.typename()) &&
                GlobalClass.nowfunc.type instanceof VoidType)
            throw new CompileError("Can't return void(ReturnStmt)", pos);
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "ReturnStmt");
        System.out.println(ss + "Expr: ");
        if (expr != null) {
            expr.output(dep + 1);
            System.out.println(ss + "ReturnType: " + expr.gettype().typename());
        }
        System.out.println(s + "EndReturnStmt");
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}