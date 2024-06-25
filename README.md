# TParser with lex/yacc for Tiny language.

## Overview

TParser is a simple parser for the TINY language, implemented using Flex and Bison. The project includes a lexer, a parser, and an abstract syntax tree (AST) generator. The parser can handle basic TINY language constructs such as read, write, if-else, repeat, and arithmetic expressions.

## Project Structure

``` sh
TParser/
├── include/
│   └── ast.h     // define all nodes of AST 
├── lib/
│   ├── setup.sh     // you can install lex Flex and Bison using the script
│   └── README.md
├── out/
├── src/
│   ├── lexer.l    // lex file  will generate lex.yy.c
│   ├── parser.y   // yacc file will generate parser.tab.c  and parser.tab.h
│   └── ast.c     // c funions to constructe and print the AST 
├── tests/
│   ├── test1.tiny   
│   ├── test2.tiny
│   ├── test3.tiny
│   ├── test4.tiny
│   └── test5.tiny
├── Makefile       // Makefile for the prgramms 
└── README.md
```

## Installation

### Prerequisites

You need to have Flex and Bison installed on your system. You can use the provided `setup.sh` script in the `lib` directory to install these tools check ./lib/README.md for installation detials.


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
