package utils;

public class CompileError extends Error {
    public CompileError(String Message, Position pos) {
        super("Compile Error: " + pos.line + ":" + pos.column + " : " + Message + "!");
    }
}