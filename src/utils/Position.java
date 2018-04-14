package utils;

import org.antlr.v4.runtime.Token;

public class Position {
    public int line, column;
    public Position(int _line, int _column) {
        line = _line;
        column = _column;
    }
    public Position(Token token) {
        line = token.getLine();
        column = token.getCharPositionInLine();
    }
    public String toString() {
        return "Line : " + line + "\tColumn ; " + column;
    }
}