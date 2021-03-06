package ast.expr;

import ast.definition.VarDef;
import ast.type.IntType;
import ast.type.Type;
import compiler.IrBuilder;
import ir.operand.Operand;
import utils.CompileError;
import utils.Position;

import java.util.HashMap;

public class RUnaryExpr extends Expr {
    public Expr expr;
    public String op;
    public Type type;
    public RUnaryExpr(Expr _e, String _op, Position _pos) {
        expr = _e;
        op = _op;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        if (type != null) return type;
        if (!(expr.gettype() instanceof IntType) || expr instanceof RUnaryExpr)
            throw new CompileError("Type Error(RUnaryExpr)", pos);
        return expr.gettype();
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        if (type == null) type = gettype();
        System.err.println(s + "RUnaryExpr:");
        System.err.println(ss + "Op: " + op);
        System.err.println(ss + "Expr:");
        expr.output(dep + 1);
        System.err.println(ss + "Type:" + type.typename());
        System.err.println(s + "EndRUnaryExpr:");
    }

    public RUnaryExpr() {}
    public Expr getinline(HashMap<String, Operand> map) {
        RUnaryExpr tmp = new RUnaryExpr();
        tmp.expr = expr.getinline(map);
        tmp.op = op;
        tmp.type = type;
        return tmp;
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}