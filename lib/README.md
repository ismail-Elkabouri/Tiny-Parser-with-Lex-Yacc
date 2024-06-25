# Setting Up the Environment

## Overview

This document provides instructions on how to install and set up the necessary tools for building and running the TParser project. The tools required are Flex (for lexical analysis) and Bison (for syntax analysis).

## Using the Setup Script -----------------------------------------------------------------------------------

Navigate to the `lib` directory and run the `setup.sh` script:

```sh
cd lib
./setup.sh
```
This script will install Flex and Bison if they are not already installed on your system.

## Manual Installation ----------------------------------------------------------------------------------------

If you don't want to use the setup script, you can install Flex and Bison manually:

### On macOS
You can install Flex and Bison using Homebrew:

```sh
brew install flex bison
```

### On Windows

You can install Flex and Bison using Cygwin or MSYS2.

 Make sure to verify the istallation .
```sh
flex --version
bison --version
```


### Makefile --------------------------------------------------------------------------------------------------

Ensure your `Makefile` in the root directory is updated to reflect the new paths:

```makefile
# Compiler and flags
CC = clang
CFLAGS = -Wall -g -fsanitize=address -fno-omit-frame-pointer
LDFLAGS = -fsanitize=address
BISON = bison
FLEX = flex

# Directories
SRC_DIR = src
INCLUDE_DIR = include
OUT_DIR = out
TEST_DIR = tests

# Files
BISON_SRC = $(SRC_DIR)/parser.y
FLEX_SRC = $(SRC_DIR)/lexer.l
AST_SRC = $(SRC_DIR)/ast.c
BISON_C = $(OUT_DIR)/parser.tab.c
BISON_H = $(OUT_DIR)/parser.tab.h
FLEX_C = $(OUT_DIR)/lex.yy.c
PARSER = $(OUT_DIR)/tiny_parser

# Targets
all: $(PARSER)

$(PARSER): $(BISON_C) $(FLEX_C) $(AST_SRC)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -o $@ $^ $(LDFLAGS)

$(BISON_C) $(BISON_H): $(BISON_SRC)
	$(BISON) -d -o $(BISON_C) $<

$(FLEX_C): $(FLEX_SRC) $(BISON_H)
	$(FLEX) -o $@ $<

# Test targets
test1: $(PARSER)
	./$(PARSER) < $(TEST_DIR)/test1.tiny

test2: $(PARSER)
	./$(PARSER) < $(TEST_DIR)/test2.tiny

test3: $(PARSER)
	./$(PARSER) < $(TEST_DIR)/test3.tiny

test4: $(PARSER)
	./$(PARSER) < $(TEST_DIR)/test4.tiny

test5: $(PARSER)
	./$(PARSER) < $(TEST_DIR)/test5.tiny

test_error: $(PARSER)
	./$(PARSER) < $(TEST_DIR)/test_error.tiny

# Clean up generated files
clean:
	rm -f $(OUT_DIR)/*

# Ensure the out directory exists
$(OUT_DIR):
	mkdir -p $(OUT_DIR)

# Make sure the out directory exists before generating files
$(BISON_C) $(FLEX_C): | $(OUT_DIR)

.PHONY: all clean test1 test2 test3 test4 test5 test_error
