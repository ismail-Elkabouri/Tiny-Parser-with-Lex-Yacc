%{
#include "ast.h"
#include "parser.tab.h"
#include <string.h>
#include <stdlib.h>
%}
%option yylineno

%%

"if"        { return IF; }
"then"      { return THEN; }
"else"      { return ELSE; }
"end"       { return END; }
"repeat"    { return REPEAT; }
"until"     { return UNTIL; }
"read"      { return READ; }
"write"     { return WRITE; }
":="        { return ASSIGN; }
"<"         { return LT; }
">"         { return GT; }
"="         { return EQ; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
";"         { return SEMI; }
[0-9]+      { yylval.num = atoi(yytext); return NUM; }
[a-zA-Z][a-zA-Z0-9]* { yylval.id = strdup(yytext); return ID; }
[ \t\r\n]+  { /* ignore whitespace */ }
.           { printf("Unrecognized character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
