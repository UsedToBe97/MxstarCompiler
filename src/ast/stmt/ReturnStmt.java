package ast.stmt;

import ast.expr.Expr;
import ast.type.Type;
import ast.type.VoidType;
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
        System.err.println(expr.gettype().typename() + "     " + GlobalClass.nowfunc.type.typename());
        if (expr == null){
            if (GlobalClass.nowfunc.type instanceof VoidType) {
                type = new VoidType(pos);
                return;
            } else throw new CompileError("Type Now Match(ReturnStmt)", pos);
        } else if (!Objects.equals(expr.gettype().typename(), GlobalClass.nowfunc.type.typename()))
            throw new CompileError("Type Now Match(ReturnStmt)", pos);
    }
}