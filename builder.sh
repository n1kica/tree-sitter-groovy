#!/bin/zsh

# Ensure script stops on any error
set -e

# Step 1: Generate Tree-sitter files
tree-sitter generate

# Step 2: Run Tree-sitter tests
tree-sitter test

# Step 3: Build the project using make
make

# Step 4: Navigate to the src directory
cd src

# Step 5: Compile parser.so
cc -shared -o parser.so parser.o

# Step 6: Move the generated parser.so to the desired location
mv ~/trees/tree-sitter-groovy/src/parser.so ~/.local/share/nvim/lazy/nvim-treesitter/parser/groovy.so

# Step 7: Copy highlight groups highlights.scm to the desired location
# cp ~/trees/tree-sitter-impex/queries/highlights.scm ~/.local/share/nvim/lazy/nvim-treesitter/queries/impex/highlights.scm

# Step 8: Navigate back to the original directory
cd ..

