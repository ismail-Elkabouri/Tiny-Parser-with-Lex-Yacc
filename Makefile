
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

# Clean up generated files
clean:
	rm -f $(OUT_DIR)/*

# Ensure the out directory exists
$(OUT_DIR):
	mkdir -p $(OUT_DIR)

# Make sure the out directory exists before generating files
$(BISON_C) $(FLEX_C): | $(OUT_DIR)

.PHONY: all clean test1 test2 test3
