package ir;

import ast.definition.VarDef;
import ir.operand.addr.GlobalAddr;

import java.util.ArrayList;
import java.util.List;

public class Ir {
    public List<Func> Funcs = new ArrayList<>();
    public List<VarDef> GV = new ArrayList<>();
    public List<String> SC = new ArrayList<>();
    public List<String> SC2 = new ArrayList<>();

    public GlobalAddr add(VarDef t) {
        t.name = t.name + "__";
        GV.add(t);
        return new GlobalAddr(t.name,false);
    }
    public GlobalAddr add(String t) {
        SC.add(t);
        return new GlobalAddr(
                "str__" + Integer.toString(SC.size() - 1), true);
    }


    public void add(Func t) {Funcs.add(t);}

    public String toString() {
        String tmp = "";
        for (VarDef u : GV) tmp += u.name + " [GV]\n";
        tmp += "\n";
        for (int i = 0; i < SC.size(); ++i) tmp += "string[ " + Integer.toString(i) + " ] " + SC.get(i) + "\n";
        tmp += "\n";
        for (Func u : Funcs) tmp += u.toString();
        return tmp;
    }
}
