# TParser with lex/yacc for Tiny language.

## Overview

TParser is a simple parser for the TINY language, implemented using Flex and Bison. The project includes a lexer, a parser, and an abstract syntax tree (AST) generator. The parser can handle basic TINY language constructs such as read, write, if-else, repeat, and arithmetic expressions.

## Project Structure

``` sh
TParser/
├── include/
│   └── ast.h     // define all nodes of AST 
├── lib/
│   ├── setup.sh     // you can install Lex Flex and Bison using the script
│   └── README.md
├── out/
├── src/
│   ├── lexer.l    // lex file  will generate lex.yy.c
│   ├── parser.y   // yacc file will generate parser.tab.c  and parser.tab.h
│   └── ast.c     // c functions to construct and print the AST 
├── tests/
│   ├── test1.tiny   
│   ├── test2.tiny
│   ├── test3.tiny
│   ├── test4.tiny
│   └── test5.tiny
├── Makefile       // Makefile for the programs 
└── README.md
```

## Installation

### Prerequisites

You need to have Flex and Bison installed on your system. You can use the provided `setup.sh` script in the `lib` directory to install these tools check ./lib/README.md for installation details.


## Building the Project

1 - Clone the repository:
```sh
git clone <repository-url>
cd LRParser
``` 

2 - clean and build 
```sh
make clean
make all
```
This will generate the parser executable tiny_parser in the out directory.

### Running Tests
To run the provided test cases, use the following commands:
```sh
make test1
make test2
make test3
make test4
make test5
```
Each command will run the parser on the corresponding test file in the tests directory and print the resulting AST or error messages.

### Adding New Tests
If you like to add your own  test case, create a new .tiny file in the tests directory and add a corresponding target in the Makefile, and make the new test to run.


## Tiny sample

```sh
 // sample test1
read x; 
if x > 0 then 
fact := 1;
repeat
fact := fact * x;
x := x - 1
until x = 0;
write fact 
end
```
```sh
 // sample test4
read x;
if x > 0 then
  fact := 1;
  repeat
    fact := fact * x;
    x := x - 1
  until x = 0;
  write fact
end;
read y;
if y < 10 then
  sum := 0;
  repeat
    sum := sum + y;
    y := y + 1
  until y = 10;
  write sum
else
  write y
end;
read a;
read b;
if a = b then
  write a
else
  if a < b then
    write b
  else
    write a
  end
end
```

## OUTPUT-------------------------------------------------------------------------------------------------------------------

```
Abstract Syntax Tree:
=======================
// test1
1: Statement Sequence
├──> 2: Statement Sequence
│   └──> 3: Read: x
└──> 4: If Statement
│   ├──> 5: Relational Operator: >
│   │   ├──> 6: Factor: x (Identifier)
│   │   └──> 7: Factor: 0 (Number)
│   └──> 8: Statement Sequence
│   │   ├──> 9: Statement Sequence
│   │   │   ├──> 10: Statement Sequence
│   │   │   │   └──> 11: Assignment: fact
│   │   │   │   │   └──> 12: Factor: 0 (Number)
│   │   │   └──> 13: Repeat Statement
│   │   │   │   ├──> 14: Statement Sequence
│   │   │   │   │   ├──> 15: Statement Sequence
│   │   │   │   │   │   └──> 16: Assignment: fact
│   │   │   │   │   │   │   └──> 17: Multiplicative Operator: *
│   │   │   │   │   │   │   │   ├──> 18: Factor: fact (Identifier)
│   │   │   │   │   │   │   │   └──> 19: Factor: x (Identifier)
│   │   │   │   │   └──> 20: Assignment: x
│   │   │   │   │   │   └──> 21: Additive Operator: -
│   │   │   │   │   │   │   ├──> 22: Factor: x (Identifier)
│   │   │   │   │   │   │   └──> 23: Factor: 0 (Number)
│   │   │   │   └──> 24: Relational Operator: =
│   │   │   │   │   ├──> 25: Factor: x (Identifier)
│   │   │   │   │   └──> 26: Factor: 0 (Number)
│   │   └──> 27: Write
│   │   │   └──> 28: Factor: fact (Identifier)

```
```
// test4
Parsing completed successfully.

Abstract Syntax Tree:
=======================

1: Statement Sequence
├──> 2: Statement Sequence
│   ├──> 3: Statement Sequence
│   │   ├──> 4: Statement Sequence
│   │   │   ├──> 5: Statement Sequence
│   │   │   │   ├──> 6: Statement Sequence
│   │   │   │   │   ├──> 7: Statement Sequence
│   │   │   │   │   │   └──> 8: Read: x
│   │   │   │   │   └──> 9: If Statement
│   │   │   │   │   │   ├──> 10: Relational Operator: >
│   │   │   │   │   │   │   ├──> 11: Factor: x (Identifier)
│   │   │   │   │   │   │   └──> 12: Factor: 0 (Number)
│   │   │   │   │   │   └──> 13: Statement Sequence
│   │   │   │   │   │   │   ├──> 14: Statement Sequence
│   │   │   │   │   │   │   │   ├──> 15: Statement Sequence
│   │   │   │   │   │   │   │   │   └──> 16: Assignment: fact
│   │   │   │   │   │   │   │   │   │   └──> 17: Factor: 0 (Number)
│   │   │   │   │   │   │   │   └──> 18: Repeat Statement
│   │   │   │   │   │   │   │   │   ├──> 19: Statement Sequence
│   │   │   │   │   │   │   │   │   │   ├──> 20: Statement Sequence
│   │   │   │   │   │   │   │   │   │   │   └──> 21: Assignment: fact
│   │   │   │   │   │   │   │   │   │   │   │   └──> 22: Multiplicative Operator: *
│   │   │   │   │   │   │   │   │   │   │   │   │   ├──> 23: Factor: fact (Identifier)
│   │   │   │   │   │   │   │   │   │   │   │   │   └──> 24: Factor: x (Identifier)
│   │   │   │   │   │   │   │   │   │   └──> 25: Assignment: x
│   │   │   │   │   │   │   │   │   │   │   └──> 26: Additive Operator: -
│   │   │   │   │   │   │   │   │   │   │   │   ├──> 27: Factor: x (Identifier)
│   │   │   │   │   │   │   │   │   │   │   │   └──> 28: Factor: 0 (Number)
│   │   │   │   │   │   │   │   │   └──> 29: Relational Operator: =
│   │   │   │   │   │   │   │   │   │   ├──> 30: Factor: x (Identifier)
│   │   │   │   │   │   │   │   │   │   └──> 31: Factor: 0 (Number)
│   │   │   │   │   │   │   └──> 32: Write
│   │   │   │   │   │   │   │   └──> 33: Factor: fact (Identifier)
│   │   │   │   └──> 34: Read: y
│   │   │   └──> 35: If Statement
│   │   │   │   ├──> 36: Relational Operator: <
│   │   │   │   │   ├──> 37: Factor: y (Identifier)
│   │   │   │   │   └──> 38: Factor: 0 (Number)
│   │   │   │   └──> 39: Statement Sequence
│   │   │   │   │   ├──> 40: Statement Sequence
│   │   │   │   │   │   ├──> 41: Statement Sequence
│   │   │   │   │   │   │   ├──> 42: Statement Sequence
│   │   │   │   │   │   │   │   └──> 43: Assignment: sum
│   │   │   │   │   │   │   │   │   └──> 44: Factor: 0 (Number)
│   │   │   │   │   │   │   └──> 45: Repeat Statement
│   │   │   │   │   │   │   │   ├──> 46: Statement Sequence
│   │   │   │   │   │   │   │   │   ├──> 47: Statement Sequence
│   │   │   │   │   │   │   │   │   │   └──> 48: Assignment: sum
│   │   │   │   │   │   │   │   │   │   │   └──> 49: Additive Operator: +
│   │   │   │   │   │   │   │   │   │   │   │   ├──> 50: Factor: sum (Identifier)
│   │   │   │   │   │   │   │   │   │   │   │   └──> 51: Factor: y (Identifier)
│   │   │   │   │   │   │   │   │   └──> 52: Assignment: y
│   │   │   │   │   │   │   │   │   │   └──> 53: Additive Operator: +
│   │   │   │   │   │   │   │   │   │   │   ├──> 54: Factor: y (Identifier)
│   │   │   │   │   │   │   │   │   │   │   └──> 55: Factor: 0 (Number)
│   │   │   │   │   │   │   │   └──> 56: Relational Operator: =
│   │   │   │   │   │   │   │   │   ├──> 57: Factor: y (Identifier)
│   │   │   │   │   │   │   │   │   └──> 58: Factor: 0 (Number)
│   │   │   │   │   │   └──> 59: Write
│   │   │   │   │   │   │   └──> 60: Factor: sum (Identifier)
│   │   │   │   │   └──> 61: Statement Sequence
│   │   │   │   │   │   └──> 62: Write
│   │   │   │   │   │   │   └──> 63: Factor: y (Identifier)
│   │   └──> 64: Read: a
│   └──> 65: Read: b
└──> 66: If Statement
│   ├──> 67: Relational Operator: =
│   │   ├──> 68: Factor: a (Identifier)
│   │   └──> 69: Factor: b (Identifier)
│   └──> 70: Statement Sequence
│   │   ├──> 71: Statement Sequence
│   │   │   └──> 72: Write
│   │   │   │   └──> 73: Factor: a (Identifier)
│   │   └──> 74: Statement Sequence
│   │   │   └──> 75: If Statement
│   │   │   │   ├──> 76: Relational Operator: <
│   │   │   │   │   ├──> 77: Factor: a (Identifier)
│   │   │   │   │   └──> 78: Factor: b (Identifier)
│   │   │   │   └──> 79: Statement Sequence
│   │   │   │   │   ├──> 80: Statement Sequence
│   │   │   │   │   │   └──> 81: Write
│   │   │   │   │   │   │   └──> 82: Factor: b (Identifier)
│   │   │   │   │   └──> 83: Statement Sequence
│   │   │   │   │   │   └──> 84: Write
│   │   │   │   │   │   │   └──> 85: Factor: a (Identifier)

```

----------------------------------------------------------------------------------------------------------------------

## Contributing
If you wish to contribute to this project, please follow these steps:

|--> Fork the repository.
|--> Create a new branch (git checkout -b feature-branch).
|--> Make your changes and commit them (git commit -am 'Add some feature').
|--> Push to the branch (git push origin feature-branch).
|--> Create a new Pull Request.
|--> Wait for the review and merge.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments and references.

This project was inspired by the LR parser implementation in the book "Compilers: Principles, Techniques, Tools 
" by Alfred Aho, Monica Lam, Ravi Sethi, and Jeffrey Ullman.
The parser generator tool Bison was used to generate the parser.
The lexical analyzer generator tool Flex was used to generate the lexer.
The CMake build system was used to manage the build process.
The C programming language was used to implement the parser and lexer.



## Contact
For any questions or suggestions, feel free to open an issue .
