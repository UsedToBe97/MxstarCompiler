package ast.definition;

import ast.type.Type;
import utils.Pair;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class FuncDef extends Def{
    public String name;
    public Type type;
    public List<Pair<Type, String>> params;
    public FuncDef(String _name, Type _type) {
        name = _name;
        type = _type;
        params = new LinkedList<>();
    }
    public void addparam(Type _t, String _s) {
        params.add(new Pair<>(_t, _s));
    }
    public Position getpos() {
        return pos;
    }
}