package compiler;

import ast.Root;
import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import parser.MxstarLexer;
import parser.MxstarParser;
import utils.CompileError;

import java.io.FileInputStream;
import java.io.InputStream;


/*
class atom{
    atom(){}
    Map<String, String> scope = new HashMap<String, String>();
}
class MyVisitor extends MxstarBaseVisitor<atom>
{

    MyVisitor() {}
    public atom visitProg(MxstarParser.ProgContext ctx)
    {
        atom rt = new atom();
        atom nullatom = new atom();

        for (int i = 0;i < ctx.varDef().size();++i)
        {
            atom tmp = new atom();
            tmp.scope.putAll(visit(ctx.varDef(i)).scope);
            for (Map.Entry<String,String> entry : tmp.scope.entrySet()) {
                if (rt.scope.containsKey(entry.getKey())) {
                    System.out.println("Var " + entry.getKey() + " already defined:");
                    System.out.println(rt.scope.get(entry.getKey()) + " -> " + entry.getValue());
                }
                //System.out.println(entry.getKey() + " : " + entry.getValue());
            }
            rt.scope.putAll(tmp.scope);
        }
        for (Map.Entry<String,String> entry : rt.scope.entrySet()) {
            System.out.println(entry.getKey() + " : " + entry.getValue());
        }
        return nullatom;
    }

    public atom visitVarDef(MxstarParser.VarDefContext ctx)
    {
        atom rt = new atom();
        rt.scope.put(ctx.name.getText(),ctx.type().getText());
        return rt;
    }

    public atom visitType(MxstarParser.TypeContext ctx)
    {
        atom nullatom = new atom();
        return nullatom;
    }

    public atom visitFuncDef(MxstarParser.FuncDefContext ctx)
    {
        return visit(ctx.block());
    }
    public atom visitBlock(MxstarParser.BlockContext ctx)
    {
        atom rt = new atom();
        //System.out.println(ctx.getText());
        for (int i = 0;i < ctx.stmt().size();++i)
        {
            rt.scope.putAll(visit(ctx.stmt(i)).scope);
            //rt.vars.putAll(visit(ctx.stmt(i)).vars);
        }
        return rt;
    }
    public atom visitStmt(MxstarParser.StmtContext ctx)
    {
        atom rt = new atom();
        //if (ctx.block() != null) rt.scope.putAll((visit(ctx.block())).scope);
        for (int i = 0;i < ctx.Stmt().size();++i)
        {
            rt.scope.putAll(visit(ctx.Stmt(i)).scope);
            //rt.vars.putAll(visit(ctx.stmt(i)).vars);
        }
        for (int i = 0;i < ctx.expr().size();++i)
        {
            //rt.vars.putAll(visit((ctx.expr(i))).vars);
        }
        if (ctx.varDef() != null) rt.scope.putAll(visit(ctx.varDef()).scope);
        return rt;
    }
    // public atom visitExprs(MxstarParser.ExprsContext ctx){}
    public atom visitExpr(MxstarParser.ExprContext ctx)
    {
        atom rt = new atom();
        for (int i = 0;i < ctx.expr().size();++i)
        {
            //rt.vars.putAll(visit(ctx.expr(i)).vars);
        }

        return rt;
    }
    // public atom visitNews(MxstarParser.NewsContext ctx){}
}
*/

public class Main {
    public static void main(String[] args) throws Exception {
        String inputFile = "D:/Study/Grade 2/Compile Principle/MxstarCompiler/test/1.test";
        //String inputFile = "program.txt";
        InputStream is = new FileInputStream(inputFile);
        CharStream input = CharStreams.fromStream(is);
        System.out.println(input);
        MxstarLexer lexer = new MxstarLexer(input);

        CommonTokenStream tokens = new CommonTokenStream(lexer);

        MxstarParser parser = new MxstarParser(tokens);
        parser.setErrorHandler(new BailErrorStrategy());
        ParseTree tree = parser.prog();
        AstBuilder AST = new AstBuilder();
        Root rt = (Root) AST.visit(tree);
        try{
            System.err.println("semantic check start");
            rt.check();
        } catch (CompileError ce) {
            System.err.println(ce.getMessage());
            System.exit(-1);
        }
        rt.output();
        //System.exit(0);
        //System.out.println(tree.toStringTree(parser));
        //System.out.println("FUCK");
    }
}