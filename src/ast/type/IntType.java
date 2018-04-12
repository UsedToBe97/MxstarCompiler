package ast.type;

import utils.Position;

public class IntType extends Type{
    public int data;
    public IntType(Position _pos) {
        pos = _pos;
    }
    public IntType() {
        data = 0;
    }
    public IntType(int _data) {
        data = _data;
    }

}