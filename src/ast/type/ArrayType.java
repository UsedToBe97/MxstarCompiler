package ast.type;

import utils.*;

public class ArrayType extends Type{
    public Type type = null;
    public int d = 0;
    public ArrayType(int _d, Type _t, Position _p) {
       pos = _p;
       d = _d;
       type = _t;
    }
    public String typename() {return "Array";}
    public String msg() {
        return "ArrayType " + pos.toString() + "\tDimension: " + d;
    }
}