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
    public IDExpr(String _s, Position _p) {
        name = _s;
        pos = _p;
    }
    public Position getpos() {
        return pos;
    }
    public Type gettype() {
        if ("null".equals((name))) {
            return new NullType(pos);
        }
        if (GlobalClass.inclass) {
            if ("this".equals(name)) {
                return new ClassType(GlobalClass.classname, pos);
            }
        }
        Def d = GlobalClass.st.now.check(name);
        if (d instanceof VarDef) {
            return ((VarDef) d).type;
        } else return new ClassType(d.getname(), pos);
    }
}