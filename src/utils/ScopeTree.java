package utils;

import ast.definition.Def;
import ast.definition.FuncDef;
import ast.type.IntType;
import ast.type.StringType;
import ast.type.VoidType;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Stack;

public class ScopeTree {
    public ScopeNode root, now;
    public ScopeTree() {
        root = new ScopeNode();
        ScopeTreeInit();
        now = root;
    }

    public Stack<HashSet<String>> scope = new Stack<>();
    public Map<String, Stack<Def>> objmap = new HashMap<>();

    public void ScopeTreeInit() {
        scope.push(new HashSet<String>());
        FuncDef tmp = new FuncDef("print", new VoidType());
        tmp.addparam(new StringType(), "str");
        root.addObj("print", tmp);
        tmp = new FuncDef("println", new VoidType());
        tmp.addparam(new StringType(), "str");
        root.addObj("println", tmp);
        root.addObj("getString", new FuncDef("getString", new StringType()));
        root.addObj("getInt", new FuncDef("getInt", new IntType()));
        root.addObj("parseInt", new FuncDef("parseInt", new IntType()));
        tmp = new FuncDef("toString", new StringType());
        tmp.addparam(new IntType(), "i");
        root.addObj("toString", tmp);
        tmp = new FuncDef("ord", new IntType());
        tmp.addparam(new IntType(), "pos");
        root.addObj("ord", tmp);
    }

    public void addObj(String _s, Def _d) {
        if (scope.peek().contains(_s))
            throw new CompileError("Var Already Defined.", _d.pos);
        System.out.println(_s);
        scope.peek().add(_s);
        Stack<Def> tmp = objmap.get(_s);
        if (tmp == null) {
            tmp = new Stack<>();
            tmp.push(_d);
            objmap.put(_s, tmp);
        } else objmap.get(_s).push(_d);
    }

    public ScopeNode enterScope() {
        ScopeNode p = now;
        now = new ScopeNode();
        p.addChild(now);
        now.addParent(p);
        return now;
    }

    public ScopeNode exitScope() {
        ScopeNode p = now;
        if (p.parent == null)
            throw new CompileError("Null Parent", new Position(-1,-1));
        now = p.parent;
        return now;
    }
    public ScopeNode peek() {return now;}
    public boolean contains(String _s) {
        if (now == null)
            throw new CompileError("Null ptr", new Position(-1,-1));
        ScopeNode p = now;
        while (p.parent != null){
            if (p.nodeContain(_s)) return true;
            p = p.parent;
        }
        return false;
    }

}