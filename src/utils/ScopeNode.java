package utils;

import ast.definition.Def;

import java.util.*;

public class ScopeNode {
    public Map<String, Def> objmap = new HashMap<>();
    public ScopeNode parent = null;
    public List<ScopeNode> child = new LinkedList<>();

    public ScopeNode(){}
    public boolean contains(String _s) {return objmap.containsKey(_s);}
    public void addChild(ScopeNode obj) {
        if (child.contains(obj))
            throw new CompileError("Redefine Child", new Position(-1,-1));
        child.add(obj);
    }
    public void addParent(ScopeNode obj) {
        if (parent != null)
            throw new CompileError("Redefine Parent", new Position(-1,-1));
        parent = obj;
    }
    public void addObj(String _s, Def _d) {
        if (objmap.containsKey(_s))
            throw new CompileError("Redefine", new Position(-1,-1));
        objmap.put(_s, _d);
    }

}