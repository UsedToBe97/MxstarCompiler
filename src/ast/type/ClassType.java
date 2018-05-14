package ast.type;

import ast.definition.ClassDef;
import utils.GlobalClass;
import utils.Position;

public class ClassType extends Type{
    public String name;
    public ClassDef classDef;
    public String typename() {return "Class" + name;}
    public ClassType(String _name, Position _pos) {
        name = _name;
        pos = _pos;
        classDef = (ClassDef) GlobalClass.st.now.check(name);
    }
}