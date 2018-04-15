package ast.type;

import org.antlr.v4.runtime.tree.TerminalNode;
import utils.Position;

public class StringType extends Type{
    public String data;
    public StringType() {}
    public String typename() {return "String";}
    public StringType(Position _pos) {
        pos = _pos;
    }
    public StringType(TerminalNode ctx) {
        data = ctx.getText();
        pos = new Position(ctx.getSymbol());
    }
}