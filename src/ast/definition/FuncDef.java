package ast.definition;

import ast.stmt.Stmt;
import ast.type.*;
import parser.MxstarParser;
import utils.CompileError;
import utils.GlobalClass;
import utils.Pair;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class FuncDef extends Def{
    public String name;
    public Type type;
    public List<Pair<Type, String>> params = new LinkedList<>();
    public List<Stmt> stmts = new LinkedList<>();
    public String getname() {return name;}
    public FuncDef(String _name, Type _type) {
        name = _name;
        type = _type;
    }
    public FuncDef(MxstarParser.FuncDefContext ctx) {
        TypeClassifier tc = new TypeClassifier();
        pos = new Position(ctx.name);
        name = ctx.name.getText();
        type = tc.Classify(ctx.type());
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
        GlobalClass.st.enterScope();
        System.err.println("Go Check FuncDef");
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
    }
}