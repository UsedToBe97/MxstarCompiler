package ast.stmt;

import ast.expr.Expr;
import ast.type.Type;
import utils.CompileError;
import utils.Position;

public class ExprStmt extends Stmt {
    public Expr expr;
    public Type type;
    public ExprStmt(Expr _e, Position _p) {
        pos = _p;
        expr = _e;
    }
    public ExprStmt(Position _pos) {pos = _pos;}
    public Position getpos() {
        return pos;
    }
    public void check() {
        System.err.println("Go Check ExprStmt");
        if (expr == null)
            throw new CompileError("Null Expr(ExprStmt)", pos);

        System.err.println(expr.toString());
        type = expr.gettype();
        System.err.println("End Check ExprStmt");
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "ExprStmt");
        expr.output(dep + 1);
    }
}