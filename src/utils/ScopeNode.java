package utils;

import ast.definition.Def;

import java.util.*;

public class ScopeNode {
    public Map<String, Def> objmap = new HashMap<>();
    public ScopeNode parent = null;
    public List<ScopeNode> child = new LinkedList<>();

    public ScopeNode(){}
    public boolean nodeContain(String _s) {return objmap.containsKey(_s);}
    public Def check(String _s) {
        ScopeNode p = this;
        System.err.println("check to " + _s);
        while (p != null) {
            if (p.objmap.containsKey(_s)) return p.objmap.get(_s);
            p = p.parent;
        }
        throw new CompileError("Undefined(ScopeNode)", new Position(-1, -1));
    }
    public void addChild(ScopeNode obj) {
        if (child.contains(obj))
            throw new CompileError("Redefine Child(ScopeNode)", new Position(-1,-1));
        child.add(obj);
    }
    public void addParent(ScopeNode obj) {
        if (parent != null)
            throw new CompileError("Redefine Parent(ScopeNode)", new Position(-1,-1));
        parent = obj;
    }
    public void addObj(String _s, Def _d) {
        if (objmap.containsKey(_s))
            throw new CompileError("Redefine(ScopeNode)", new Position(-1,-1));
        objmap.put(_s, _d);
        System.err.println("ScopeNode Added : " + _s + " ; " +_d);
    }

}