package ast.definition;

import parser.MxstarParser;
import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class ClassDef extends Def {
    public String name;
    public List<Def> Deflist;

    public ClassDef(MxstarParser.ClassDefContext ctx) {
        name = ctx.Identifier().getText();
        pos = new Position(ctx.name);
        Deflist = new LinkedList<>();
    }

    public ClassDef(Position _pos) {pos = _pos;}
    public void setName(String _name) {name = _name;}
    public void add(Def _d) {Deflist.add(_d);}
    public String getName() {return name;}
    public Position getpos() {return pos;}
}