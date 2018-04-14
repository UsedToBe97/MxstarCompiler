package ast.stmt;

import utils.Position;

import java.util.LinkedList;
import java.util.List;

public class BlockStmt extends Stmt {
    public List<Stmt> Stmts;
    public BlockStmt(Position _pos) {
        Stmts = new LinkedList<>();
        pos = _pos;
    }
    public void add(Stmt _s) {Stmts.add(_s);}
    public Position getpos() {
        return pos;
    }

}