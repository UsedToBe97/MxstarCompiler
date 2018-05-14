package ir;

import ast.definition.VarDef;
import ir.operand.addr.GlobalAddr;

import java.util.ArrayList;
import java.util.List;

public class Ir {
    public List<Func> Funcs = new ArrayList<>();
    public List<VarDef> GV = new ArrayList<>();
    public List<String> SC = new ArrayList<>();

    public GlobalAddr add(VarDef t) {
        GV.add(t);
        return new GlobalAddr(t.name ,false);
    }
    public GlobalAddr add(String t) {
        SC.add(t);
        return new GlobalAddr(
                "str__" + Integer.toString(SC.size() - 1), true);
    }


    public void add(Func t) {Funcs.add(t);}
}
