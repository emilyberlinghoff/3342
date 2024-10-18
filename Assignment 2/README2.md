# FIRST and FOLLOW Set Calculator

This Python program calculates the FIRST and FOLLOW sets for all non-terminals in a given context-free grammar. The program reads the grammar from a text file, computes the sets, and outputs them in a specified format to an output file.

## Table of Contents
- [How it works](#how-it-works)
- [Input Format](#input-format)
- [Output Format](#output-format)
- [Running the Program](#running-the-program)
- [Example](#example)
- [Files](#files)

## How it works

The program reads a grammar from a file, where each production is defined in the format `A -> BC` or `A -> ε` for epsilon (empty string) productions.  
- It computes the **FIRST** sets, which represent the set of terminals that can appear at the beginning of some string derived from a non-terminal.
- It computes the **FOLLOW** sets, which represent the set of terminals that can appear immediately to the right of a non-terminal in some "sentential form."
- The program writes the results in the required format to an output file.

## Input Format

The input file should contain one production per line.  
Each production follows the format `A -> BC` where `A` is a non-terminal, and `BC` are terminals or non-terminals.  
Epsilon (the empty string) is represented by an empty right-hand side of the production.  
There is no `|` (alternative) symbol allowed; each production should be written separately.

Example Grammar (in `g.txt`)
```rust
S -> AC
A -> aAb
A -> 
C -> C c
C -> 
```
