/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUM = 258,
     ID = 259,
     IF = 260,
     THEN = 261,
     ELSE = 262,
     END = 263,
     REPEAT = 264,
     UNTIL = 265,
     READ = 266,
     WRITE = 267,
     ASSIGN = 268,
     LT = 269,
     GT = 270,
     EQ = 271,
     PLUS = 272,
     MINUS = 273,
     TIMES = 274,
     DIVIDE = 275,
     LPAREN = 276,
     RPAREN = 277,
     SEMI = 278
   };
#endif
/* Tokens.  */
#define NUM 258
#define ID 259
#define IF 260
#define THEN 261
#define ELSE 262
#define END 263
#define REPEAT 264
#define UNTIL 265
#define READ 266
#define WRITE 267
#define ASSIGN 268
#define LT 269
#define GT 270
#define EQ 271
#define PLUS 272
#define MINUS 273
#define TIMES 274
#define DIVIDE 275
#define LPAREN 276
#define RPAREN 277
#define SEMI 278




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 7 "src/parser.y"
{
    int num;
    char* id;
    ASTNode* node;
}
/* Line 1529 of yacc.c.  */
#line 101 "out/parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

