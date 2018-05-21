package ast.expr;

import ast.type.ArrayType;
import ast.type.IntType;
import ast.type.Type;
import compiler.IrBuilder;
import ir.operand.addr.MemAddr;
import utils.CompileError;
import utils.Position;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ArrayExpr extends Expr {
    public Expr Leftexpr;
    public List<Expr> exprList;
    public Type type = null;
    public List<MemAddr> MemList = new ArrayList<>();//ID ex : r17 = qword[r10 + r16 * 8]
    public ArrayExpr(Expr _e) {
        Leftexpr = _e;
        exprList = new LinkedList<>();
        pos = _e.getpos();
    }
    public void add(Expr _e) {
        exprList.add(_e);
    }
    public Position getpos() {
        return pos;
    }

    public Type gettype() {
        if (type != null) return type;
        System.err.println("Get Type ArrayExpr");
        //System.err.println(pos.toString());
        int tmpd = 0;
        System.err.println(Leftexpr);
        System.err.println(exprList.size());
        if (Leftexpr instanceof NewExpr) {
            System.err.println(Leftexpr.gettype());
            //if (((NewExpr) Leftexpr).d1 != ((NewExpr) Leftexpr).d)
            //    throw new CompileError("Index Error(ArrayExpr)", pos);
        }
        for (Expr u : exprList) {
            ++tmpd;
            if (!(u.gettype() instanceof IntType))
                throw new CompileError("Index Error(ArrayExpr)", pos);
        }
        System.err.println("Here");
        System.err.println(Leftexpr.gettype().typename());
        System.err.println(((ArrayType) Leftexpr.gettype()).d);
        if (Leftexpr.gettype() instanceof ArrayType) {
            int ff =((ArrayType) Leftexpr.gettype()).d - tmpd;
            System.err.println(ff);
            if (ff == 0)
                return type = ((ArrayType) Leftexpr.gettype()).type;
            else if (ff > 0) return type = new ArrayType(ff, ((ArrayType) Leftexpr.gettype()).type, pos);
            else throw new CompileError("Index Too Many(ArrayExpr)", pos);
        } else {
            System.err.println("Go There");
            throw new CompileError("LeftExpr Error(ArrayExpr)", pos);
        }
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "ArrayExpr:");
        System.out.println(ss + "LeftExpr:");
        Leftexpr.output(dep + 1);
        System.out.println(ss + "exprList:");
        for(Expr e : exprList) {
            e.output(dep + 1);
        }
        System.out.println(s + "EndArrayExpr:");
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }

}