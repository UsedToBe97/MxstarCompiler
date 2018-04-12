// Generated from D:/Study/Grade 2/Compile Principle/MxstarCompiler/src/parser\Mxstar.g4 by ANTLR 4.7
package parser;

package parser;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxstarParser}.
 */
public interface MxstarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxstarParser#prog}.
	 * @param ctx the parse tree
	 */
	void enterProg(MxstarParser.ProgContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#prog}.
	 * @param ctx the parse tree
	 */
	void exitProg(MxstarParser.ProgContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void enterClassDefinition(MxstarParser.ClassDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void exitClassDefinition(MxstarParser.ClassDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void enterVariableDefinition(MxstarParser.VariableDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void exitVariableDefinition(MxstarParser.VariableDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDefinition(MxstarParser.FunctionDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDefinition(MxstarParser.FunctionDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(MxstarParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(MxstarParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(MxstarParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(MxstarParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(MxstarParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(MxstarParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(MxstarParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(MxstarParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(MxstarParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(MxstarParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(MxstarParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(MxstarParser.ExpressionListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#someType}.
	 * @param ctx the parse tree
	 */
	void enterSomeType(MxstarParser.SomeTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#someType}.
	 * @param ctx the parse tree
	 */
	void exitSomeType(MxstarParser.SomeTypeContext ctx);
}