package utils;

import ast.definition.*;
import ast.type.*;

import java.util.*;

public class ScopeTree {
    public Stack<HashSet<String>> scope = new Stack<>();
    public Map<String, Stack<Def>> objmap = new HashMap<>();

    public ScopeTree() {
        scope.push(new HashSet<String>());
        FuncDef tmp = new FuncDef("print", new VoidType());
        tmp.addparam(new StringType(), "str");
        addObj("print", tmp);
        tmp = new FuncDef("println", new VoidType());
        tmp.addparam(new StringType(), "str");
        addObj("println", tmp);
        addObj("getString", new FuncDef("getString", new StringType()));
        addObj("getInt", new FuncDef("getInt", new IntType()));
        tmp = new FuncDef("toString", new StringType());
        tmp.addparam(new IntType(), "i");
        addObj("toString", tmp);
    }

    public void addObj(String _s, Def _d) {
        if (scope.peek().contains(_s)) System.exit(-1);
        scope.peek().add(_s);
        Stack<Def> tmp = objmap.get(_s);
        if (tmp == null) {
            tmp = new Stack<>();
            tmp.push(_d);
            objmap.put(_s, tmp);
        } else objmap.get(_s).push(_d);
    }

    public void enterScope() {
        scope.push(new HashSet<String>());
    }

    public void exitScope() {
        HashSet<String> tmp = scope.peek();
        for (String s : tmp) {
            objmap.get(s).pop();
        }
        scope.pop();
    }
}