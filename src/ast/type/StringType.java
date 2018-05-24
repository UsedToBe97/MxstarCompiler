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
        data = data.substring(1, data.length() - 1);
        String tmp = "";
        for (int i = 0; i < data.length(); ++i) {
            if (i + 1 < data.length() && data.substring(i, i + 1).equals("\\")) {
                if (data.substring(i + 1, i + 2).equals("n")) tmp += "\n";
                if (data.substring(i + 1, i + 2).equals("\\")) tmp += "\\";
                if (data.substring(i + 1, i + 2).equals("\"")) tmp += "\"";
                if (data.substring(i + 1, i + 2).equals("t")) tmp += "\t";
                ++i;
            } else tmp += data.substring(i, i + 1);
        }
        data = tmp;
        pos = new Position(ctx.getSymbol());
    }
}