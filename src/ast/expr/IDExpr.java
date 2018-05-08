package ast.expr;

import ast.definition.Def;
import ast.definition.VarDef;
import ast.type.ClassType;
import ast.type.NullType;
import ast.type.Type;
import utils.GlobalClass;
import utils.Position;

public class IDExpr extends Expr {
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
        System.err.println("Get Type ID");
        if (type != null) return type;
        if ("null".equals((name))) {
            return type = new NullType(pos);
        }
        if (GlobalClass.inclass) {
            if ("this".equals(name)) {
                return type = new ClassType(GlobalClass.classname, pos);
            }
        }
        String tmp = GlobalClass.classname + "." + name;
        System.err.println(tmp);
        Def d;
        if (GlobalClass.st.contains(name)) d = GlobalClass.st.now.check(name);
        else d = GlobalClass.st.now.check(tmp);
        if (d instanceof VarDef) {
            System.err.println("type is " + ((VarDef) d).type);
            return type = ((VarDef) d).type;
        } else return type = new ClassType(d.getname(), pos);
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
        System.out.println(s + "EndIDExpr:");
    }
}