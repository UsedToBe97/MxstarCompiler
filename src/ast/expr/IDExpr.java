package ast.expr;

import ast.definition.ClassDef;
import ast.definition.Def;
import ast.definition.VarDef;
import ast.type.ClassType;
import ast.type.NullType;
import ast.type.Type;
import compiler.IrBuilder;
import utils.GlobalClass;
import utils.Position;

public class IDExpr extends Expr {
    public VarDef varDef;
    public String name;
    public Type type = null;
    public IDExpr(String _s, Position _p) {
        name = _s;
        pos = _p;
    }
    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        if (name.equals("rhs")) {
            int cnt = 0;
            ++cnt;
            ///
        }
        System.err.println("Get Type ID");
        GlobalClass.st.print();
        //varDef = (VarDef) GlobalClass.st.now.check(name);
        if (type != null) return type;
        if ("null".equals((name))) {
            return type = new NullType(pos);
        }
        if (GlobalClass.inclass) {
            if ("this".equals(name)) {
                ClassDef cd = (ClassDef) GlobalClass.st.now.check(GlobalClass.classname);
                ClassType tot = new ClassType(GlobalClass.classname, pos, cd);
                return type = tot;
            }
        }
        String tmp = GlobalClass.classname + "." + name;
        System.err.println(tmp);
        Def d;
        if (!GlobalClass.st.contains(tmp)) d = GlobalClass.st.now.check(name);
        else if (!GlobalClass.st.contains(name)) d = GlobalClass.st.now.check(tmp);
        else if (GlobalClass.st.now.getDep(name) < GlobalClass.st.now.getDep(tmp)) d = GlobalClass.st.now.check(name);
        else d = GlobalClass.st.now.check(tmp);
        if (name.equals("rhs")) {
            int cnt2 = 0;
            ++cnt2;
            ///
        }
        if (d instanceof VarDef) {
            System.err.println("type is " + ((VarDef) d).type);
            this.varDef = (VarDef) d;
            return type = ((VarDef) d).type;
        } else return type = new ClassType(d.getname(), pos, (ClassDef) GlobalClass.st.now.check(d.getname()));
    }

    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "IDExpr:");
        System.out.println(ss + "Name: " + name);
        if (varDef != null)System.out.println(ss + "VarDef !!!!");
        System.out.println(s + "EndIDExpr:");
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}