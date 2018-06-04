package utils;

import ast.definition.FuncDef;
import compiler.AstBuilder;

import java.util.HashSet;
import java.util.Set;

public class GlobalClass {
    public static ScopeTree st = new ScopeTree();
    public static Set<String> RVset = new HashSet<>();
    public static int circnt = 0;
    public static boolean infunc = false;
    public static boolean inclass = false;
    public static String classname = "";
    public static FuncDef nowfunc = null;
    public static void addRV(String _s) {
        if (AstBuilder.setR) RVset.add(_s);
    }
    public static void setRV(String _s) { RVset.add(_s);}
    public static boolean isRV(String _s) {
        //System.err.println("check to " + _s);
        if (RVset.contains(_s)) return true;
        else return false;
        //throw new CompileError("Undefined(ScopeNode)", new Position(-1, -1));
    }
}