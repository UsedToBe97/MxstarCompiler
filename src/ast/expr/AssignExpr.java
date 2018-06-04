package ast.expr;

import ast.type.ArrayType;
import ast.type.NullType;
import ast.type.Type;
import compiler.IrBuilder;
import ir.operand.Operand;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.HashMap;

public class AssignExpr extends Expr {
    public Expr expr1, expr2;
    public AssignExpr(Expr _e1, Expr _e2, Position _pos) {
        expr1 = _e1;
        expr2 = _e2;
        pos = _pos;
    }

    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        //System.err.println("Assign!");
        //System.err.println(pos.toString());
        if (!(expr1 instanceof IDExpr || expr1 instanceof ArrayExpr || expr1 instanceof MemberExpr))
            throw new CompileError("Left Expr Error(AssignExpr)", pos);
        //System.err.println(GlobalClass.classname);
        //System.err.println(expr1);
        Type t1 = expr1.gettype();
        if (expr1 instanceof ArrayExpr && ((ArrayExpr) expr1).Leftexpr instanceof IDExpr) {
            if (t1 instanceof ArrayType) {
                GlobalClass.setRV(((IDExpr) ((ArrayExpr) expr1).Leftexpr).name);
            }
        }
        if (expr1 instanceof ArrayExpr) {
            if (((ArrayExpr) expr1).Leftexpr instanceof IDExpr) {
                //if (((IDExpr) ((ArrayExpr) expr1).Leftexpr).name.contains("useless"))
                if (!GlobalClass.isRV(((IDExpr) ((ArrayExpr) expr1).Leftexpr).name))
                    del = true;
            }
        }
        Type t2 = expr2.gettype();
        if (expr1 instanceof IDExpr)
            if (((IDExpr) expr1).name.equals("this"))
                throw new CompileError("This is a reversed word(AssignExpr)", pos);
        //System.err.println(t1.typename() + " = " + t2.typename());
        if (!t1.typename().equals(t2.typename()) && !(t2 instanceof NullType))
            throw new CompileError("Type Error(AssignExpr)", pos);
        return t1;
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.err.println(s + "AssignExpr:");
        System.err.println(ss + "LeftExpr:");
        expr1.output(dep + 1);
        System.err.println(ss + "RightExpr:");
        expr2.output(dep + 1);;
        System.err.println(s + "EndAssignExpr:");
    }
    public AssignExpr() {}
    public Expr getinline(HashMap<String, Operand> map) {
        AssignExpr tmp = new AssignExpr();
        tmp.expr1 = expr1.getinline(map);
        tmp.expr2 = expr2.getinline(map);
        return tmp;
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}