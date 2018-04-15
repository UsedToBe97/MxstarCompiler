package ast.type;

import utils.Position;

public class BoolType extends Type{
    public boolean data;
    public BoolType(Position _pos) {
        pos = _pos;
    }
    public BoolType(String _s) {
        data = _s.equals("false") ? false : true;
    }
}