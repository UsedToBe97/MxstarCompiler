package compiler;

import ast.*;
import ast.definition.*;
import ast.expr.*;
import ast.stmt.*;
import org.antlr.v4.runtime.ParserRuleContext;
import parser.*;
import utils.*;

public class AstBuilder extends MxstarBaseVisitor<Atom> {
    public ScopeTree tree = Main.st;
    public String classname = "";
    public boolean inclass = false;
    public boolean infunc = false;
    @Override
    public Atom visitProg(MxstarParser.ProgContext ctx) {
        Root prog = new Root();
        int tot = 0;
        for (ParserRuleContext child : ctx.def()) {
            ++tot;
            System.out.println(tot);
            prog.add((Def)visit(child));
        }
        System.out.println("ExitProg");

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
        System.out.println("EnterFunc");
        FuncDef tmp = new FuncDef(ctx);
        infunc = true;
        int tot = 0;
        for (ParserRuleContext child : ctx.block().stmt()) {
            ++tot;
            System.out.println(tot);
            tmp.addstmt((Stmt)visit(child));
        }
        if (inclass) tree.addObj(classname + "." + tmp.name, tmp);
        else tree.addObj(tmp.name, tmp);
        infunc = false;
        System.out.println("ExitFunc");
        return tmp;
    }

    @Override
    public Atom visitVarDef(MxstarParser.VarDefContext ctx) {

        System.out.println("EnterVarDef");
        VarDef tmp = new VarDef(ctx);
        if (ctx.expr() != null) tmp.setExpr((Expr)(visit(ctx.expr())));
        if (inclass && !infunc) tree.addObj(classname + "." + tmp.getName(), tmp);

        System.out.println("???");
        if (!inclass && !infunc) tree.addObj(tmp.name, tmp);

        System.out.println("ExitVarDef");
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

    @Override
    public Atom visitBracketExpr(MxstarParser.BracketExprContext ctx) {
        return visit(ctx.expr());
    }

    /*@Override
    public Atom visitConstantExpr(MxstarParser.ConstantExprContext ctx) {
        return null;
    }*/

    @Override
    public Atom visitIDExpr(MxstarParser.IDExprContext ctx) {
        return new IDExpr(ctx.Identifier().getText(),
                new Position(ctx.Identifier().getSymbol()));
    }

    @Override
    public Atom visitFuncExpr(MxstarParser.FuncExprContext ctx) {
        FuncExpr tmp = new FuncExpr(ctx);
        for (ParserRuleContext child : ctx.exprList().expr()) {
            tmp.add((Expr)visit(child));
        }
        return tmp;
    }

    @Override
    public Atom visitMemberExpr(MxstarParser.MemberExprContext ctx) {
        MemberExpr tmp = new MemberExpr((Expr)visit(ctx.expr()),
                ctx.Identifier().getText(),
                new Position(ctx.getStart()));
        return tmp;
    }

    @Override
    public Atom visitMemberFuncExpr(MxstarParser.MemberFuncExprContext ctx) {
        MemberFuncExpr tmp = new MemberFuncExpr(ctx);
        tmp.who = (Expr) visit(ctx.expr());
        if (ctx.exprList() != null) {
            for (ParserRuleContext child : ctx.exprList().expr()) tmp.add((Expr)visit(child));
        }
        return tmp;
    }

    @Override
    public Atom visitArrayExpr(MxstarParser.ArrayExprContext ctx) {
        ArrayExpr tmp = new ArrayExpr((Expr)visit(ctx.expr(0)));
        int k = 1;
        while (ctx.expr(k) != null) {
            tmp.add((Expr)visit(ctx.expr(k)));
            ++k;
        }
        return tmp;
    }

    @Override
    public Atom visitNewExpr(MxstarParser.NewExprContext ctx) {
        NewExpr tmp = new NewExpr(ctx.baseType());
        int d1 = 0, d2 = 0;
        for (ParserRuleContext _e : ctx.expr()) {
            tmp.add((Expr)visit(_e));
            ++d1;
        }
        if (ctx.brackets() != null)
            d2 = ctx.brackets().getText().length() / 2;
        tmp.d1 = d1;
        tmp.d2 = d2;
        tmp.d = d1 + d2;
        return tmp;
    }

    @Override
    public Atom visitLUnaryExpr(MxstarParser.LUnaryExprContext ctx) {
        return new LUnaryExpr((Expr)visit(ctx.expr()),
                ctx.op.getText(), new Position(ctx.getStart()));
    }

    @Override
    public Atom visitBinaryExpr(MxstarParser.BinaryExprContext ctx) {
        return new BinaryExpr((Expr)visit(ctx.expr(0)),
                (Expr)visit(ctx.expr(1)),
                ctx.op.getText(), new Position(ctx.getStart()));
    }

    @Override
    public Atom visitRUnaryExpr(MxstarParser.RUnaryExprContext ctx) {
        return new RUnaryExpr((Expr)visit(ctx.expr()),
                ctx.op.getText(), new Position(ctx.getStart()));
    }

    @Override
    public Atom visitAssignExpr(MxstarParser.AssignExprContext ctx) {
        return new AssignExpr((Expr)visit(ctx.expr(0)),
                (Expr)visit(ctx.expr(1)),
                new Position(ctx.getStart()));
    }
}
