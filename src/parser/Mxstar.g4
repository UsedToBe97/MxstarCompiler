grammar Mxstar;

prog:
    def* EOF
;

def:
    (classDef | funcDef | varDef)
;

classDef:
    'class' name=Identifier '{' inClassDef* '}'
;

inClassDef:
    (varDef | funcDef)
;

varDef:
    type name=Identifier ('=' expr)? ';'
;

funcDef:
    type name=Identifier '(' parameterList ')' block
;

parameterList:
    (parameter (',' parameter)*)?
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
    | 'if' '(' expr ')' stmt
           ('else' 'if' '(' expr ')' stmt)* ('else' stmt )?            # IfStmt
    | 'while' '(' expr ')' (stmt)                                      # WhileStmt
    | 'for' '(' first=expr? ';' second=expr? ';' third=expr? ')'
            stmt                                                       # ForStmt
    | varDef                                                           # VarDefStmt
    | 'return' expr? ';'                                               # ReturnStmt
    | name=('break' | 'continue') ';'                                  # CtrlStmt
;

type:
    (baseType brackets)
;

baseType:
    (Identifier | 'int' | 'bool' | 'string' | 'void')
;

expr:
     '(' expr ')'                                                      # BracketExpr
    | op=('++' | '--' | '+' | '-') expr                                # LUnaryExpr
    | expr op=('++' | '--')                                            # RUnaryExpr
    | op=('~' | '!' ) expr                                             # LUnaryExpr
    | constant                                                         # ConstantExpr
    | Identifier                                                       # IDExpr
    | Identifier '(' exprList? ')'                                     # FuncExpr
    | expr '.' Identifier                                              # MemberExpr
    | expr '.' Identifier '(' exprList? ')'                            # MemberFuncExpr
    | 'new' (baseType)
        ('[' expr ']')* brackets                                       # NewExpr
    | expr ('[' expr ']')+                                             # ArrayExpr


    | expr op=('*' | '/' | '%') expr                                   # BinaryExpr
    | expr op=('+' | '-') expr                                         # BinaryExpr
    | expr op=('<<' | '>>') expr                                       # BinaryExpr

    | expr op=('<' | '>' | '>=' | '<=') expr                           # BinaryExpr
    | expr op=('==' | '!=' ) expr                                      # BinaryExpr

    | expr op=('&' | '^' | '|') expr                                   # BinaryExpr
    | expr op=('&&' | '||') expr                                       # BinaryExpr

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