package ast;

import utils.*;

public class NullType extends Type{
    public String name = "null";
    public NullType(Position _pos) {
        pos = _pos;
    }
}