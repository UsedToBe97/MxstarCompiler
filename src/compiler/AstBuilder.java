package compiler;

import ast.Atom;
import ast.Root;
import ast.definition.ClassDef;
import ast.definition.Def;
import ast.definition.FuncDef;
import ast.definition.VarDef;
import ast.expr.Expr;
import ast.stmt.*;
import org.antlr.v4.runtime.ParserRuleContext;
import parser.MxstarBaseVisitor;
import parser.MxstarParser;
import utils.Position;
import utils.ScopeTree;

public class AstBuilder extends MxstarBaseVisitor<Atom> {
    public ScopeTree tree = Main.st;
    public String classname = "";
    public boolean inclass = false;
    public boolean infunc = false;
    @Override
    public Atom visitProg(MxstarParser.ProgContext ctx) {
        Root prog = new Root();
        for (ParserRuleContext child : ctx.def()) prog.add((Def)visit(child));
        return prog;
    }

    @Override
    public Atom visitClassDef(MxstarParser.ClassDefContext ctx) {
        inclass = true;
        ClassDef tmp = new ClassDef(ctx);
        classname = tmp.name;
        for (ParserRuleContext child : ctx.inClassDef()) tmp.add((Def) visit(child));
        inclass = false;
        classname = "";
        tree.addObj(tmp.name, tmp);
        return tmp;
    }

    @Override
    public Atom visitFuncDef(MxstarParser.FuncDefContext ctx) {
        FuncDef tmp = new FuncDef(ctx);
        infunc = true;
        for (ParserRuleContext child : ctx.block().stmt()) {
            tmp.addstmt((Stmt)visit(child));
        }
        if (inclass) tree.addObj(classname + "." + tmp.name, tmp);
        else tree.addObj(tmp.name, tmp);
        infunc = false;
        return tmp;
    }

    @Override
    public Atom visitVarDef(MxstarParser.VarDefContext ctx) {
        VarDef tmp = new VarDef(ctx);
        if (ctx.expr() != null) tmp.setExpr((Expr)(visit(ctx.expr())));
        if (inclass && !infunc) tree.addObj(classname + "." + tmp.getName(), tmp);
        if (!inclass) tree.addObj(tmp.name, tmp);
        return tmp;
    }

    @Override
    public Atom visitBlock(MxstarParser.BlockContext ctx) {
        BlockStmt tmp = new BlockStmt(new Position(ctx.getStart()));
        for (ParserRuleContext child : ctx.stmt()) tmp.add((Stmt)visit(child));
        return tmp;
    }

    @Override
    public Atom visitExprStmt(MxstarParser.ExprStmtContext ctx) {
        return (ctx.expr() != null)
                ? new ExprStmt((Expr)visit(ctx.expr()), new Position(ctx.getStart()))
                : null;
    }

    @Override
    public Atom visitIfStmt(MxstarParser.IfStmtContext ctx) {
        IfStmt tmp = new IfStmt(new Position(ctx.getStart()));
        tmp.add((Expr)visit(ctx.expr(0)), (Stmt)visit(ctx.stmt(0)));
        int k = 1;
        while (ctx.expr(k) != null) {
            tmp.add((Expr)visit(ctx.expr(k)), (Stmt)visit(ctx.stmt(k)));
            ++k;
        }
        if (ctx.stmt(k) != null) tmp.addElse((Stmt)visit(ctx.stmt(k)));
        return tmp;
    }

    @Override
    public Atom visitReturnStmt(MxstarParser.ReturnStmtContext ctx) {
        return (ctx.expr() != null)
                ? new ReturnStmt((Expr)visit(ctx.expr()), new Position(ctx.getStart()))
                : null;
    }

    @Override
    public Atom visitForStmt(MxstarParser.ForStmtContext ctx) {
        ForStmt tmp = new ForStmt((Stmt)visit(ctx.stmt()),
                new Position(ctx.getStart()));
        tmp.add((Expr)visit(ctx.first));
        tmp.add((Expr)visit(ctx.second));
        tmp.add((Expr)visit(ctx.third));
        return tmp;
    }

    @Override
    public Atom visitWhileStmt(MxstarParser.WhileStmtContext ctx) {
        return new WhileStmt((Expr)visit(ctx.expr()),
                (Stmt)visit(ctx.stmt()),
                new Position(ctx.getStart()));
    }

    @Override
    public Atom visitCtrlStmt(MxstarParser.CtrlStmtContext ctx) {
        if ("break".equals(ctx.name.getText())) return new BreakStmt(new Position(ctx.getStart()));
        if ("continue".equals(ctx.name.getText())) return new ContStmt(new Position(ctx.getStart()));
        return null;
    }

}
