package ast.definition;

import ast.type.NullType;
import parser.MxstarParser;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class ClassDef extends Def {
    public String name;
    public List<Def> Deflist;

    public ClassDef(MxstarParser.ClassDefContext ctx) {
        name = ctx.Identifier().getText();
        pos = new Position(ctx.name);
        Deflist = new LinkedList<>();
    }

    public ClassDef(Position _pos) {pos = _pos;}
    public void setName(String _name) {name = _name;}
    public void add(Def _d) {Deflist.add(_d);}
    public String getname() {return name;}
    public Position getpos() {return pos;}
    public void check() {
        System.err.println("Go Check ClassDef " + name);
        GlobalClass.classname = name;
        GlobalClass.inclass = true;
        GlobalClass.st.enterScope();
        for (Def d : Deflist) {
            if (d instanceof FuncDef) {
                System.err.println(((FuncDef) d).name + "///" + name);
                if (((FuncDef) d).type instanceof NullType && !((FuncDef) d).name.equals(name))
                    throw new CompileError("Construct Func Error(ClassDef)", pos);
            }
            //if (d instanceof VarDef) GlobalClass.st.addObj(d.getname(), d);
        }
        for (Def d : Deflist) if (d != null) d.check();
        GlobalClass.st.exitScope();
        GlobalClass.classname = "";
        GlobalClass.inclass = false;
    }
    public void output(int dep) {
        int tmp = dep;
        String s = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        System.out.println(s + "Class : " + name + " at " + pos.toString());
        for (Def d : Deflist) d.output(dep + 1);
    }
}