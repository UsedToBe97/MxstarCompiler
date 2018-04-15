package ast.type;

import utils.*;

public class NullType extends Type{
    public String name = "null";
    public String typename() {return "null";}
    public NullType(Position _pos) {
        pos = _pos;
    }
}