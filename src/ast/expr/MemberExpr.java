package ast.expr;

import ast.definition.Def;
import ast.definition.VarDef;
import ast.type.ClassType;
import ast.type.Type;
import compiler.IrBuilder;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

public class MemberExpr extends Expr {
    public Expr who;
    public String name;
    public Type type;
    public VarDef varDef;
    public Position getpos() {
        return pos;
    }
    public MemberExpr(Expr _e, String _s, Position _p) {
        who = _e;
        name = _s;
        pos = _p;
        varDef = (VarDef) GlobalClass.st.now.check(_s);
    }
    public Type gettype() {
        if (type != null) return type;
        Type t = who.gettype();
        if (t instanceof ClassType) {
            String tmp = ((ClassType) t).name + '.' + name;
            Def d = GlobalClass.st.now.check(tmp);
            if (!(d instanceof VarDef))
                throw new CompileError("No Member(MemberExpr)", pos);
            return type = ((VarDef) d).type;
        } else throw new CompileError("No This Class(MemberExpr)", pos);
    }

    public void output(int dep) {
        int tmp = dep;
        String s = "", ss = "";
        while (tmp > 0) {
            tmp--;
            s += "\t";
        }
        ss = s + "\t";
        System.out.println(s + "MemberExpr:");
        System.out.println(ss + "Who: ");
        who.output(dep + 1);
        System.out.println(ss + "name:" + name);
        if (type != null)
            System.out.println(ss + "Type:" + type.typename());
        System.out.println(s + "EndMemberExpr:");
    }
    public void accept(IrBuilder ib){
        ib.visit(this);
    }
}