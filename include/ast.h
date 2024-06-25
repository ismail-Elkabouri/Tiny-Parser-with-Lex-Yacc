#ifndef TINY_H
#define TINY_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef enum {
    NODE_PROGRAM, NODE_STMT_SEQ, NODE_IF, NODE_REPEAT, NODE_ASSIGN, NODE_READ, NODE_WRITE,
    NODE_EXP, NODE_SIMPLE_EXP, NODE_TERM, NODE_FACTOR, NODE_RELOP, NODE_ADDOP, NODE_MULOP
} NodeType;

typedef struct ASTNode {
    NodeType type;
    struct ASTNode *left;
    struct ASTNode *right;
    union {
        int num;
        char *id;
    } value;
} ASTNode;

ASTNode* newASTNode(NodeType type, ASTNode *left, ASTNode *right, int num, const char *id);
void printAST(ASTNode *node, int level, bool isLast);
void freeAST(ASTNode *node);

void yyerror(const char *s);
int yylex(void);

extern int yylineno;
extern char* yytext;

#endif // TINY_H
