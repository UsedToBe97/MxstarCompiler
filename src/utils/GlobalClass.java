package utils;

import ast.definition.FuncDef;

public class GlobalClass {
    public static ScopeTree st = new ScopeTree();
    public static int circnt = 0;
    public static boolean infunc = false;
    public static boolean inclass = false;
    public static String classname = "";
    public static FuncDef nowfunc = null;
}