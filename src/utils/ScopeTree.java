package utils;

import ast.definition.Def;
import ast.definition.FuncDef;
import ast.type.*;

public class ScopeTree {
    public ScopeNode root, now;
    public ScopeTree() {
        root = new ScopeNode();
        ScopeTreeInit();
        now = root;
    }

    //public Stack<HashSet<String>> scope = new Stack<>();
    //public Map<String, Stack<Def>> objmap = new HashMap<>();

    public void ScopeTreeInit() {
        //scope.push(new HashSet<String>());
        FuncDef tmp = new FuncDef("print", new VoidType());
        tmp.addparam(new StringType(), "str");
        root.addObj("print", tmp);

        tmp = new FuncDef("println", new VoidType());
        tmp.addparam(new StringType(), "str");
        root.addObj("println", tmp);

        root.addObj("getString", new FuncDef("getString", new StringType()));

        root.addObj("getInt", new FuncDef("getInt", new IntType()));

        //root.addObj("string.parseInt", new FuncDef("string.parseInt", new IntType()));
        tmp = new FuncDef("string.parseInt", new IntType());
        tmp.addparam(new StringType(), "this");
        root.addObj("string.parseInt", tmp);

        //root.addObj("string.length", new FuncDef("string.length", new IntType()));
        tmp = new FuncDef("string.length", new IntType());
        tmp.addparam(new StringType(), "this");
        root.addObj("string.length", tmp);

        //root.addObj("array.size", new FuncDef("array.size", new IntType()));

        tmp = new FuncDef("array.size", new IntType());
        tmp.addparam(new ArrayType(1), "this");
        root.addObj("array.size", tmp);



        tmp = new FuncDef("string.substring", new StringType());
        tmp.addparam(new StringType(), "this");
        tmp.addparam(new IntType(), "left");
        tmp.addparam(new IntType(), "right");
        root.addObj("string.substring", tmp);

        tmp = new FuncDef("toString", new StringType());
        tmp.addparam(new IntType(), "i");
        root.addObj("toString", tmp);

        tmp = new FuncDef("string.ord", new IntType());
        tmp.addparam(new StringType(), "this");
        tmp.addparam(new IntType(), "pos");
        root.addObj("string.ord", tmp);

        root.addObj("this", new FuncDef("this", new NullType(new Position(-1, -1))));
    }
    public void print() {
        /*System.err.println("\n\n---------------print----------");
        ScopeNode p = now;
        do {
            for (String s : p.objmap.keySet()) {
                System.err.println(s);
            }
            System.err.println("\n---------------next----------\n");
            p = p.parent;
        } while (p != null);
        System.err.println("---------------print----------\n\n");*/
    }
    public void addObj(String _s, Def _d) {
        now.addObj(_s, _d);
        /*if (scope.peek().contains(_s))
            throw new CompileError("Var Already Defined.", _d.pos);
        System.out.println(_s);
        scope.peek().add(_s);
        Stack<Def> tmp = objmap.get(_s);
        if (tmp == null) {
            tmp = new Stack<>();
            tmp.push(_d);
            objmap.put(_s, tmp);
        } else objmap.get(_s).push(_d);*/
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
            throw new CompileError("Null Parent(ScopeTree)", new Position(-1,-1));
        now = p.parent;
        return now;
    }
    public ScopeNode peek() {return now;}
    public boolean contains(String _s) {
        if (now == null)
            throw new CompileError("Null ptr(ScopeTree)", new Position(-1,-1));
        ScopeNode p = now;
        do {
            if (p.nodeContain(_s)) return true;
            p = p.parent;
        } while (p != null);
        return false;
    }

}