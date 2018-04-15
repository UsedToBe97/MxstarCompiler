package ast.type;

import utils.Position;

public class ClassType extends Type{
    public String name;
    public String typename() {return "Class";}
    public ClassType(String _name, Position _pos) {
        name = _name;
        pos = _pos;
    }
}