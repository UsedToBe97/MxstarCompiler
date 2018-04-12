grammar Mxstar;

prog:
    (classDef | funcDef | varDef)* EOF
;

classDef:
    'class' name=Identifier '{' (varDef | funcDef)* '}'
;

varDef:
    type name=Identifier ('=' expr)? ';'
;

funcDef:
    type name=Identifier '(' (parameter (',' parameter)*)? ')' block
;

parameter:
    type Identifier
;

block:
    '{' stmt* '}'
;

stmt:
    expr? ';'                                                          # ExprStmt
    | block                                                            # BlockStmt
    | 'if' '(' expr ')' (block | stmt) ('else' (block | stmt) )?       # IfStmt
    | 'while' '(' expr ')' (block | stmt)                              # WhileStmt
    | 'for' '(' expr? ';' expr? ';' expr? ')' (block | stmt)           # ForStmt
    | varDef                                                           # VarDefStmt
    | 'return' expr ';'                                                # ReturnStmat
    | ('break' | 'continue') ';'                                       # CtrlStmt
;

type:
    (baseType brackets)
;

baseType:
    (Identifier | 'int' | 'bool' | 'string' | 'void')
;

expr:
    '(' expr ')'                                                       # BracketExpr
    | constant                                                         # ConstantExpr
    | Identifier                                                       # IDExpr
    | Identifier '(' exprList? ')'                                     # FuncExpr
    | expr '.' expr                                                    # MemberExpr
    | expr ('[' expr ']')+                                             # ArrayExpr
    | 'new' (Identifier | 'int'| 'string') ('[' expr ']')* brackets    # NewExpr
    | ('+' | '-') expr                                                 # SignExpr
    | expr ('*' | '/' | '%') expr                                      # BinaryExpr
    | expr ('+' | '-') expr                                            # BinaryExpr
    | expr ('&' | '^' | '|') expr                                      # BinaryExpr
    | expr ('<<' | '>>') expr                                          # BinaryExpr
    | expr ('<' | '>' | '>=' | '<=') expr                              # BinaryExpr
    | expr ('==' | '!=' ) expr                                         # BinaryExpr
    | expr ('&&' | '||') expr                                          # BinaryExpr
    | ('++' | '--') expr                                               # LSelfExpr
    | expr ('++' | '--')                                               # RSelfExpr
    | ('~' | '!' ) expr                                                # NotExpr
    | <assoc=right> expr '=' expr                                      # AssignExpr
;

exprList:
    expr (',' expr)*
;

brackets:
    ('[]')*
;

constant:
    'null'
    | ConstInteger
    | ConstString
    | 'true'
    | 'false'
;
/*
someType:
    ConstInteger
    | ConstString
    | 'true'
    | 'false'
    | 'null'
    | 'this'
    | Identifier
;*/



//lexer

ConstInteger:
    [1-9] [0-9]*
    | '0'
;

ConstString:
     '"' ('\\"' | ~'"')* '"'
;

Identifier: [a-zA-Z_] [a-zA-Z_0-9]* ;

Whitespace:	[ \t]+ -> skip;

Newline: ('\r' '\n'? | '\n') -> skip;

BlockComment: '/*' .*? '*/' -> skip;

LineComment: '//' ~[\r\n]* -> skip;