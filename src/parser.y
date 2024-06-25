%{
#include "ast.h"

ASTNode *astRoot;
%}

%union {
    int num;
    char* id;
    ASTNode* node;
}

%token <num> NUM
%token <id> ID

%token IF THEN ELSE END REPEAT UNTIL READ WRITE
%token ASSIGN
%token LT GT EQ
%token PLUS MINUS TIMES DIVIDE
%token LPAREN RPAREN SEMI

%type <node> program stmt_sequence statement if_stmt repeat_stmt assign_stmt read_stmt write_stmt exp simple_exp term factor relop addop mulop

%%

program:
    stmt_sequence { astRoot = $1; }
    ;

stmt_sequence:
    statement { $$ = newASTNode(NODE_STMT_SEQ, $1, NULL, 0, NULL); }
    | stmt_sequence SEMI statement { $$ = newASTNode(NODE_STMT_SEQ, $1, $3, 0, NULL); }
    ;

statement:
    if_stmt { $$ = $1; }
    | repeat_stmt { $$ = $1; }
    | assign_stmt { $$ = $1; }
    | read_stmt { $$ = $1; }
    | write_stmt { $$ = $1; }
    ;

if_stmt:
    IF exp THEN stmt_sequence END { $$ = newASTNode(NODE_IF, $2, $4, 0, NULL); }
    | IF exp THEN stmt_sequence ELSE stmt_sequence END { $$ = newASTNode(NODE_IF, $2, newASTNode(NODE_STMT_SEQ, $4, $6, 0, NULL), 0, NULL); }
    ;

repeat_stmt:
    REPEAT stmt_sequence UNTIL exp { $$ = newASTNode(NODE_REPEAT, $2, $4, 0, NULL); }
    ;

assign_stmt:
    ID ASSIGN exp { $$ = newASTNode(NODE_ASSIGN, $3, NULL, 0, $1); }
    ;

read_stmt:
    READ ID { $$ = newASTNode(NODE_READ, NULL, NULL, 0, $2); }
    ;

write_stmt:
    WRITE exp { $$ = newASTNode(NODE_WRITE, $2, NULL, 0, NULL); }
    ;

exp:
    simple_exp { $$ = $1; }
    | simple_exp relop simple_exp { $$ = newASTNode(NODE_EXP, $1, $3, 0, NULL); $2->left = $1; $2->right = $3; $$ = $2; }
    ;

simple_exp:
    term { $$ = $1; }
    | simple_exp addop term { $$ = newASTNode(NODE_SIMPLE_EXP, $1, $3, 0, NULL); $2->left = $1; $2->right = $3; $$ = $2; }
    ;

term:
    factor { $$ = $1; }
    | term mulop factor { $$ = newASTNode(NODE_TERM, $1, $3, 0, NULL); $2->left = $1; $2->right = $3; $$ = $2; }
    ;

factor:
    LPAREN exp RPAREN { $$ = $2; }
    | NUM { $$ = newASTNode(NODE_FACTOR, NULL, NULL, $1, NULL); }
    | ID { $$ = newASTNode(NODE_FACTOR, NULL, NULL, 0, $1); }
    ;

relop:
    LT { $$ = newASTNode(NODE_RELOP, NULL, NULL, 0, "<"); }
    | GT { $$ = newASTNode(NODE_RELOP, NULL, NULL, 0, ">"); }
    | EQ { $$ = newASTNode(NODE_RELOP, NULL, NULL, 0, "="); }
    ;

addop:
    PLUS { $$ = newASTNode(NODE_ADDOP, NULL, NULL, 0, "+"); }
    | MINUS { $$ = newASTNode(NODE_ADDOP, NULL, NULL, 0, "-"); }
    ;

mulop:
    TIMES { $$ = newASTNode(NODE_MULOP, NULL, NULL, 0, "*"); }
    ;
    | DIVIDE { $$ = newASTNode(NODE_MULOP, NULL, NULL, 0, "/"); }
    
%%



void yyerror(const char *s) {
    fprintf(stderr, "Error at line %d: %s\nNear token: %s\n", yylineno, s, yytext);
}

int main() {
    printf("test parsing ...\n");
   ;
    
    int result = yyparse();
    
    if (result == 0) {
        printf("\nParsing completed successfully.\n");
        if (astRoot) {
            printf("\nAbstract Syntax Tree:\n");
            printf("=======================\n\n");
            printAST(astRoot, 0, true);
            freeAST(astRoot);
        } else {
            printf("AST root is NULL\n");
        }
    } else {
        printf("Parsing failed.\n");
    }
    
    return result;
}

