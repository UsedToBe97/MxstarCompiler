package utils;

public class CompileError extends Error {
    public CompileError(String Message, Position pos) {
        super("Compilation error: " + pos.line + ":" + pos.column + " : " + Message + "!");
    }
}