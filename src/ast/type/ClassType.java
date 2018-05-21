package ast.type;

import ast.definition.ClassDef;
import utils.Position;

public class ClassType extends Type{
    public String name;
    public ClassDef classDef;
    public String typename() {return "Class" + name;}
    public ClassType(String _name, Position _pos, ClassDef _classDef) {
        name = _name;
        pos = _pos;
        classDef = _classDef;
        //(ClassDef) GlobalClass.st.now.check(name);
    }
    public ClassType(String _name, Position _pos) {
        name = _name;
        pos = _pos;
        //classDef = (ClassDef) GlobalClass.st.now.check(name);
    }
}