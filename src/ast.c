// this file conatian two helper functions for construct and print the AST.

#include "ast.h"
#include <stdbool.h>
#include <string.h>

static int line_number = 1;

ASTNode* newASTNode(NodeType type, ASTNode *left, ASTNode *right, int num, const char *id) {
    ASTNode *node = (ASTNode *)malloc(sizeof(ASTNode));
    if (node == NULL) {
        fprintf(stderr, "Memory allocation failed for new AST node\n");
        exit(1);
    }
    node->type = type;
    node->left = left;
    node->right = right;
    node->value.num = num;
    node->value.id = id ? strdup(id) : NULL;
    return node;
}

void printAST(ASTNode *node, int level, bool isLast) {
    if (node == NULL) return;

    for (int i = 0; i < level - 1; i++) {
        printf("│   ");
    }
    
    if (level > 0) {
        printf(isLast ? "└──> " : "├──> ");
    }

   
    printf("%d: ", line_number++);
    switch (node->type) {
        case NODE_PROGRAM: printf("Program\n"); break;
        case NODE_STMT_SEQ: printf("Statement Sequence\n"); break;
        case NODE_IF: printf("If Statement\n"); break;
        case NODE_REPEAT: printf("Repeat Statement\n"); break;
        case NODE_ASSIGN: 
            printf("Assignment");
            if (node->value.id) printf(": %s", node->value.id);
            printf("\n");
            break;
        case NODE_READ: 
            printf("Read");
            if (node->value.id) printf(": %s", node->value.id);
            printf("\n");
            break;
        case NODE_WRITE: printf("Write\n"); break;
        case NODE_EXP: printf("Expression\n"); break;
        case NODE_SIMPLE_EXP: printf("Simple Expression\n"); break;
        case NODE_TERM: printf("Term\n"); break;
        case NODE_FACTOR:
            if (node->value.id) {
                printf("Factor: %s (Identifier)\n", node->value.id);
            } else {
                printf("Factor: %d (Number)\n", node->value.num);
            }
            break;
        case NODE_RELOP: 
            printf("Relational Operator");
            if (node->value.id) printf(": %s", node->value.id);
            printf("\n");
            break;
        case NODE_ADDOP: 
            printf("Additive Operator");
            if (node->value.id) printf(": %s", node->value.id);
            printf("\n");
            break;
        case NODE_MULOP: 
            printf("Multiplicative Operator");
            if (node->value.id) printf(": %s", node->value.id);
            printf("\n");
            break;
        default: printf("Unknown Node Type\n"); break;
    }

   
    if (node->left) {
        printAST(node->left, level + 1, node->right == NULL);
    }


    if (node->right) {
        printAST(node->right, level + 1, true);
    }
}

void freeAST(ASTNode *node) {
    if (node == NULL) return;
    freeAST(node->left);
    freeAST(node->right);
    if (node->value.id) {
        free(node->value.id);
    }
    free(node);
}

