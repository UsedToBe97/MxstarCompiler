package ast.expr;

import ast.type.*;
import compiler.IrBuilder;
import utils.CompileError;
import utils.Position;

import java.util.Objects;

public class BinaryExpr extends Expr {
    public Expr expr1, expr2;
    public String op;
    public Type type = null;
    public BinaryExpr(Expr _e1, Expr _e2, String _op, Position _pos) {
        expr1 = _e1;
        expr2 = _e2;
        op = _op;
        pos = _pos;
    }
    public Position getpos() {
        return pos;
    }

    public Type gettype() {
        if (type != null) return type;
        //System.err.println("Binary FUCK!!!!!! op " + op);

        Type t1 = expr1.gettype(), t2 = expr2.gettype();
        //System.err.println(t1 + "  :::  " + t2);
        if (op.equals("+")) {
            if (!(t1 instanceof IntType || t1 instanceof StringType))
                throw new CompileError("Type Error(Binary Expr)", pos);
            if (!(t2 instanceof IntType || t2 instanceof StringType))
                throw new CompileError("Type Error(Binary Expr)", pos);
        } else if (op.equals("==") || op.equals("!=")) {
            if (!(t1 instanceof IntType || t1 instanceof StringType || t1 instanceof ClassType || t1 instanceof NullType || t1 instanceof BoolType || t1 instanceof ArrayType))
                throw new CompileError("Type Error(Binary Expr)", pos);
            if (!(t2 instanceof IntType || t2 instanceof StringType || t2 instanceof ClassType || t2 instanceof NullType || t2 instanceof BoolType || t2 instanceof ArrayType))
                throw new CompileError("Type Error(Binary Expr)", pos);
        }else if (op.equals("<=") || op.equals(">") || op.equals(">=") || op.equals("<")) {
            if (!(t1 instanceof IntType || t1 instanceof StringType))
                throw new CompileError("Type Error(Binary Expr)", pos);
            if (!(t2 instanceof IntType || t2 instanceof StringType))
                throw new CompileError("Type Error(Binary Expr)", pos);
        }
        else if (op.equals("&&") || op.equals("||")) {
            if (!(t1 instanceof BoolType))
                throw new CompileError("Type Error(Binary Expr)", pos);
            if (!(t2 instanceof BoolType))
                throw new CompileError("Type Error(Binary Expr)", pos);

        } else {
            if (!(t1 instanceof IntType || t2 instanceof IntType))
                throw new CompileError("Type Error(Binary Expr)", pos);
        }
        //System.err.println(t1 + "  ////  " + t2);
        if (!(Objects.equals(t1.typename(), t2.typename())) &&
                !(t1 instanceof NullType && t2 instanceof ClassType) &&
                !(t2 instanceof NullType && t1 instanceof ClassType) &&
                !(t1 instanceof NullType && t2 instanceof ArrayType) &&
                !(t2 instanceof NullType && t1 instanceof ArrayType)
                ) throw new CompileError("Type Error(Binary Expr)", pos);
        if (op.equals("&&") || op.equals("||") || op.equals(">=") ||
                op.equals("<=") || op.equals("<") || op.equals(">")) return type = new BoolType(pos);
        if (op.equals("==") || op.equals("!=")) return type = new BoolType(pos);
        return type = t1;
    }

    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.err.println(s + "BinaryExpr:");
        System.err.println(ss + "Expr1:");
        expr1.output(dep + 1);
        System.err.println(ss + " op: " + op);
        System.err.println(ss + "Expr2:");
        expr2.output(dep + 1);;
        if (type != null)
            System.err.println(ss + "RES_Type:" + type.typename());
        System.err.println(s + "EndBinaryExpr:");
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}