package compiler;

import ast.Atom;
import ast.Root;
import ast.definition.ClassDef;
import ast.definition.Def;
import ast.definition.FuncDef;
import ast.definition.VarDef;
import ast.expr.*;
import ast.stmt.*;
import ast.type.*;
import org.antlr.v4.runtime.ParserRuleContext;
import parser.MxstarBaseVisitor;
import parser.MxstarParser;
import utils.CompileError;
import utils.GlobalClass;
import utils.Position;
import utils.ScopeTree;

public class AstBuilder extends MxstarBaseVisitor<Atom> {
    public ScopeTree tree = GlobalClass.st;
    public String classname = "";
    public boolean inclass = false;
    public boolean infunc = false;
    public FuncDef nowfunc = null;
    public Root prog = new Root();
    static public boolean setR = false;
    @Override
    public Atom visitProg(MxstarParser.ProgContext ctx) {
        int tot = 0;
        for (ParserRuleContext child : ctx.def()) {
            ++tot;
            //System.err.println(tot);
            prog.add((Def)visit(child));
        }
        return prog;
    }

    @Override
    public Atom visitClassDef(MxstarParser.ClassDefContext ctx) {
        inclass = true;
        ClassDef tmp = new ClassDef(ctx);
        tree.addObj(tmp.name, tmp);
        classname = tmp.name;
        for (ParserRuleContext child : ctx.inClassDef()) {
            if (child instanceof MxstarParser.FuncDefContext) visit(child);
            else tmp.add((Def) visit(child));
        }
        inclass = false;
        classname = "";
        return tmp;
    }

    @Override
    public Atom visitFuncDef(MxstarParser.FuncDefContext ctx) {
        //System.err.println("EnterFunc");
        FuncDef tmp = new FuncDef(ctx, inclass, classname);
        infunc = true;
        nowfunc = tmp;
        //System.err.println(tmp.name + "!!!!!!!");
        if (tmp.name.equals("this"))
            throw new CompileError("This is a reversed word", new Position(ctx.name));
        if (inclass) {
            tree.addObj(classname + "." + tmp.name, tmp);
            tmp.name = classname + "." + tmp.name;
        }
        else tree.addObj(tmp.name, tmp);
        for (ParserRuleContext child : ctx.block().stmt()) {
            tmp.addstmt((Stmt)visit(child));
        }
        if (inclass) prog.add(tmp);
        infunc = false;
        nowfunc = null;
        //System.err.println("ExitFunc");
        return tmp;
    }

    @Override
    public Atom visitVarDef(MxstarParser.VarDefContext ctx) {
        VarDef tmp = new VarDef(ctx);
        if (ctx.expr() != null) {
            tmp.setExpr((Expr) (visit(ctx.expr())));
        }
        if (inclass && !infunc) tree.addObj(classname + "." + tmp.getname(), tmp);

        //if (!inclass && !infunc) tree.addObj(tmp.name, tmp);

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
        //System.err.println("Enter IfStmt");
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
            : new ReturnStmt(null, new Position(ctx.getStart()));
    }

    @Override
    public Atom visitForStmt(MxstarParser.ForStmtContext ctx) {
        ForStmt tmp = new ForStmt((Stmt)visit(ctx.stmt()),
                new Position(ctx.getStart()));
        System.err.println("For : " +  new Position(ctx.getStart()));
        if (ctx.first != null) tmp.add((Expr)visit(ctx.first));
        else tmp.add(new ConstExpr(new NullType(tmp.pos)));
        if (ctx.second != null) tmp.add((Expr)visit(ctx.second));
        else tmp.add(new ConstExpr(new NullType(tmp.pos)));
        if (ctx.third != null) tmp.add((Expr)visit(ctx.third));
        else tmp.add(new ConstExpr(new NullType(tmp.pos)));
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
        GlobalClass.addRV(ctx.Identifier().getText());
        IDExpr tmp = new IDExpr(ctx.Identifier().getText(),
                new Position(ctx.getStart()));
        return tmp;
    }

    @Override
    public Atom visitFuncExpr(MxstarParser.FuncExprContext ctx) {
        FuncExpr tmp = new FuncExpr(ctx);
        if (inclass && !GlobalClass.st.contains(ctx.Identifier().getText())) tmp.add(new IDExpr("this", new Position(ctx.getStart())));
        else if (inclass && GlobalClass.st.contains(classname + "." + ctx.Identifier().getText())) tmp.add(new IDExpr("this", new Position(ctx.getStart())));;
        if (infunc && nowfunc.name.equals(tmp.name)) nowfunc.re = true;
        if (ctx.exprList() != null) {
            for (ParserRuleContext child : ctx.exprList().expr()) {
                tmp.add((Expr) visit(child));
            }
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
        //MemberFuncExpr tmp = new MemberFuncExpr(ctx);
        FuncExpr tmp = new FuncExpr(ctx);
        tmp.add((Expr) visit(ctx.expr()));
        if (ctx.exprList() != null) {
            for (ParserRuleContext child : ctx.exprList().expr()) tmp.add((Expr)visit(child));
        }
        //prog.add((Def)tmp);
        tmp.isMemFunc = true;
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
        //System.err.println("EnterNewExpr");
        NewExpr tmp = new NewExpr(ctx.baseType());
        int d1 = 0, d2 = 0;
        //int d1 = ctx.bracketsexpr().exprbr().size(), d2 = ctx.bracketsexpr().rawbr().size();
        //System.err.println(ctx.bracketsexpr().size());
        for (MxstarParser.BracketsexprContext _e : ctx.bracketsexpr()) {
            //System.err.println(d1 + " ///// " + d2);
            if (_e.rawbr() == null) {
                tmp.add((Expr) visit(_e.exprbr().expr()));
                ++d1;
                if (d2 > 0)
                    throw new CompileError("New Error(Astbuilder)", new Position(ctx.getStart()));
            } else ++d2;
        }
        //if (ctx.brackets() != null)
        //    d2 = ctx.brackets().getText().length() / 2;
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
    public Atom visitConstantExpr(MxstarParser.ConstantExprContext ctx) {
        MxstarParser.ConstantContext tmp = ctx.constant();
        if (tmp.ConstInteger() != null){
            return new ConstExpr(new IntType(tmp.ConstInteger()));
        } else if (tmp.ConstString() != null) {
            return new ConstExpr(new StringType(tmp.ConstString()));
        } else if (tmp.getText().equals("true") || tmp.getText().equals("false")) {
            return new ConstExpr(new BoolType((tmp.getText())));
        } else return new ConstExpr(new NullType(new Position(tmp.getStart())));
    }

    @Override
    public Atom visitBinaryExpr(MxstarParser.BinaryExprContext ctx) {
        //System.err.println("Enter Binary Expr");
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
        Expr t1 = (Expr)visit(ctx.expr(0));
        System.err.println("Assign : " +  new Position(ctx.getStart()));
        setR = true;
        Expr t2 = (Expr)visit(ctx.expr(1));
        setR = false;
        return new AssignExpr(t1, t2,
                new Position(ctx.getStart()));
    }

}
