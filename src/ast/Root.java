package ast;

import ast.definition.Def;

import java.util.List;

public class Root extends Atom {
    public List<Def> deflist;
    public void add(Def _def) {deflist.add(_def);}
}