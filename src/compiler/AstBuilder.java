package compiler;

import ast.Atom;
import ast.Root;
import ast.definition.Def;
import ast.definition.VarDef;
import ast.expr.Expr;
import ast.type.TypeClassifier;
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
    public Atom visitVarDef(MxstarParser.VarDefContext ctx) {
        VarDef tmp = new VarDef(new Position(ctx.getStart()));
        tmp.setName(ctx.Identifier().getText());
        tmp.setType(new TypeClassifier().Classify(ctx.type()));
        if (ctx.expr() != null) tmp.setExpr((Expr)(visit(ctx.expr())));
        if (inclass && !infunc) tree.addObj(classname + "." + tmp.getName(), tmp);
        return tmp;
    }

    @Override
    public Atom visitClassDef(MxstarParser.ClassDefContext ctx) {

    }
}
