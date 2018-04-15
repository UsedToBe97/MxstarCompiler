package ast.type;

import org.antlr.v4.runtime.tree.TerminalNode;
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
    public IntType(TerminalNode ctx) {
        data = Integer.parseInt(ctx.getText());
        pos = new Position(ctx.getSymbol());
    }
}