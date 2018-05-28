package ast.definition;

import ast.expr.ConstExpr;
import ast.expr.Expr;
import ast.type.*;
import compiler.IrBuilder;
import parser.MxstarParser;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

public class VarDef extends Def {
    public String name;
    public Expr expr = null;
    public Type type;
    public boolean inClass = false; // IR;
    public boolean isGlobal = false; // IR;
    public int offset = 0; //IR;
    public VarDef() {}
    public VarDef(MxstarParser.VarDefContext ctx) {
        pos = new Position(ctx.getStart());
        setName(ctx.Identifier().getText());
        setType(new TypeClassifier().Classify(ctx.type()));
    }
    public VarDef(Type _t, String _name) {
        type = _t;
        name = _name;
    }


    public VarDef(Position _pos) {pos = _pos;}
    public void setName(String _name) {name = _name;}
    public void setType(Type _type) {type = _type;}
    public void setExpr(Expr _expr) {expr = _expr;}
    public String getname() {return name;}
    public Type getType() {return type;}
    public Position getpos() {return pos;}
    public Expr getExpr() {return expr;}
    public void check() {
        //System.err.println("Go Check VarDef   " + name);
        if (type instanceof ClassType) {
            Def d = GlobalClass.st.now.check(((ClassType) type).name);
            //System.err.println("next ");
            GlobalClass.st.print();
            if (!(d instanceof ClassDef))
                throw new CompileError("Undefined Class(VarDef)", pos);
        }
        if (type instanceof ArrayType) {
            Type t = ((ArrayType)type).type;
            if (t instanceof VoidType)
                throw new CompileError("Void Array(VarDef)", pos);
            if (t instanceof ClassType) GlobalClass.st.now.check(((ClassType) t).name);
        }
        if (type instanceof VoidType)
            throw new CompileError("Void ?!!(VarDef)", pos);
        if (type instanceof StringType && expr != null) {
            if (expr instanceof ConstExpr)
                if (expr.gettype() instanceof NullType)
                    throw new CompileError("String = null(VarDef)", pos);
        }
        if (expr != null) {
            //System.err.println(expr.gettype().typename() + " //// " + type.typename());
            if (!expr.gettype().typename().equals("null"))
                if (!expr.gettype().typename().equals(type.typename()))
                    throw new CompileError("Can't def(VarDef)", pos);
        }
        GlobalClass.st.now.addObj(name, this);
        GlobalClass.st.print();
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        System.err.println(s + "Var: " + type.typename() + " with name " + name);
        if (expr != null) {
            expr.output(dep + 1);
        }
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}