package ast;

import ast.definition.Def;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class Root extends Atom {
    public List<Def> deflist = new LinkedList<>();
    public void add(Def _def) {deflist.add(_def);}
    public void check() {
        if (!GlobalClass.st.contains("main"))
            throw new CompileError("Lost Main", new Position(-1, -1));
        for (Def d : deflist) d.check();
    }
}