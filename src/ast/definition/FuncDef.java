package ast.definition;

import ast.stmt.Stmt;
import ast.type.*;
import compiler.IrBuilder;
import ir.inst.Label;
import parser.MxstarParser;
import utils.CompileError;
import utils.GlobalClass;
import utils.Pair;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class FuncDef extends Def{
    public String name;
    public Type type = new NullType(pos);
    public List<Pair<Type, String>> params = new LinkedList<>();
    public List<Def> paramList = new LinkedList<>();
    public List<Stmt> stmts = new LinkedList<>();
    public String getname() {return name;}
    public Label label = null; // IR;
    public FuncDef(String _name, Type _type) {
        name = _name;
        type = _type;
    }
    public FuncDef(MxstarParser.FuncDefContext ctx, boolean inclass, String classname) {
        TypeClassifier tc = new TypeClassifier();
        pos = new Position(ctx.name);
        name = ctx.name.getText();
        if (ctx.type() != null)
            type = tc.Classify(ctx.type());
        else type = new NullType(pos);
        if (inclass) {
            addparam(new ClassType(classname, pos), "this");
        }
        int tot = 0;
        for (MxstarParser.ParameterContext tmp : ctx.parameterList().parameter()) {
            addparam(tc.Classify(tmp.type()), tmp.Identifier().getText());
            ++tot;
        }
        if (name.equals("main") && (tot != 0 || !(type instanceof IntType)))
            throw new CompileError("Main can't have parameter(FuncDef)", new Position(-1, -1));
    }
    public void addparam(Type _t, String _s) {
        params.add(new Pair<>(_t, _s));
        paramList.add(new VarDef(_t, _s));
    }
    public void addstmt(Stmt _s) {
        stmts.add(_s);
    }
    public Position getpos() {
        return pos;
    }
    public void check() {
        GlobalClass.infunc = true;
        GlobalClass.nowfunc = this;
        if (paramList.size() > 0 && params.get(0).getFirst() instanceof ClassType) {
            GlobalClass.inclass = true;
            GlobalClass.classname = ((ClassType) params.get(0).getFirst()).name;
        }
        GlobalClass.st.enterScope();
        if ("this".equals(name))
            throw new CompileError("this is a reverse word(FuncDef)", pos);
        System.err.println("Go Check FuncDef");
        System.err.println(GlobalClass.nowfunc.name);
        if (type instanceof ClassType) GlobalClass.st.now.check(((ClassType) type).name);
        for (Pair<Type, String> u : params) {
            Type t = u.getFirst();
            if (t instanceof ClassType) GlobalClass.st.now.check(((ClassType) t).name);
            if (t instanceof ArrayType){
                if (((ArrayType) t).type instanceof ClassType) {
                    GlobalClass.st.now.check(((ClassType) ((ArrayType) t).type).name);
                }
            }
            VarDef tmp = new VarDef(pos);
            tmp.setName(u.getSecond());
            tmp.setType(u.getFirst());
            GlobalClass.st.addObj(tmp.name, tmp);
        }
        GlobalClass.st.print();
        for (Stmt s : stmts) if (s != null) s.check();
        GlobalClass.st.exitScope();
        GlobalClass.infunc = false;
        GlobalClass.nowfunc = null;
        GlobalClass.inclass = false;
        GlobalClass.classname = "";
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        System.err.println(s + "Func : " + name + " at " + pos.toString());
        ss = s + "\t";
        System.err.println(ss + "---Param(s)---");
        for (Pair<Type, String> p : params) {
            System.err.println(ss + p.getFirst().typename() + " with name " + p.getSecond());
        }
        System.err.println(ss + "---End of Param(s)---");
        for (Stmt st : stmts) {
            if (st != null) st.output(dep + 1);
        }
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}