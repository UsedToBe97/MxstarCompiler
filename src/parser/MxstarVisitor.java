// Generated from D:/Study/Grade 2/Compile Principle/MxstarCompiler/src/parser\Mxstar.g4 by ANTLR 4.7
package parser;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MxstarParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MxstarVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MxstarParser#prog}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProg(MxstarParser.ProgContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#def}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDef(MxstarParser.DefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#classDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDef(MxstarParser.ClassDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#varDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVarDef(MxstarParser.VarDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#funcDef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFuncDef(MxstarParser.FuncDefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#parameter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameter(MxstarParser.ParameterContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(MxstarParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprStmt}
	 * labeled alternative in {@link MxstarParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprStmt(MxstarParser.ExprStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code BlockStmt}
	 * labeled alternative in {@link MxstarParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlockStmt(MxstarParser.BlockStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code IfStmt}
	 * labeled alternative in {@link MxstarParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStmt(MxstarParser.IfStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code WhileStmt}
	 * labeled alternative in {@link MxstarParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhileStmt(MxstarParser.WhileStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ForStmt}
	 * labeled alternative in {@link MxstarParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForStmt(MxstarParser.ForStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code VarDefStmt}
	 * labeled alternative in {@link MxstarParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVarDefStmt(MxstarParser.VarDefStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ReturnStmat}
	 * labeled alternative in {@link MxstarParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnStmat(MxstarParser.ReturnStmatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code CtrlStmt}
	 * labeled alternative in {@link MxstarParser#stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCtrlStmt(MxstarParser.CtrlStmtContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitType(MxstarParser.TypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#baseType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBaseType(MxstarParser.BaseTypeContext ctx);
	/**
	 * Visit a parse tree produced by the {@code IDExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIDExpr(MxstarParser.IDExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code BinaryExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBinaryExpr(MxstarParser.BinaryExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ConstantExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstantExpr(MxstarParser.ConstantExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code FuncExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFuncExpr(MxstarParser.FuncExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code AssignExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssignExpr(MxstarParser.AssignExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code SignExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSignExpr(MxstarParser.SignExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ArrayExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArrayExpr(MxstarParser.ArrayExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code MemberExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMemberExpr(MxstarParser.MemberExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code NewExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewExpr(MxstarParser.NewExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code BracketExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBracketExpr(MxstarParser.BracketExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code NotExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNotExpr(MxstarParser.NotExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code LSelfExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLSelfExpr(MxstarParser.LSelfExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code RSelfExpr}
	 * labeled alternative in {@link MxstarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRSelfExpr(MxstarParser.RSelfExprContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#exprList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprList(MxstarParser.ExprListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#brackets}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBrackets(MxstarParser.BracketsContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#constant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstant(MxstarParser.ConstantContext ctx);
}