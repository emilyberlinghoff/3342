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

1. The program reads a grammar from a file, where each production is defined in the format `A -> BC` or `A -> ε` for epsilon (empty string) productions.
2. It computes the **FIRST** sets, which represent the set of terminals that can appear at the beginning of some string derived from a non-terminal.
3. It computes the **FOLLOW** sets, which represent the set of terminals that can appear immediately to the right of a non-terminal in some "sentential form."
4. The program writes the results in the required format to an output file.

## Input Format

The input file should contain one production per line.  
Each production follows the format `A -> BC` where `A` is a non-terminal, and `BC` are terminals or non-terminals.  
Epsilon (the empty string) is represented by an empty right-hand side of the production.  
There is no `|` (alternative) symbol allowed; each production should be written separately.

### Example Grammar (in `g.txt`)
```rust
S -> AC
A -> aAb
A -> 
C -> C c
C -> 
```

## Output Format

The output will contain the FIRST and FOLLOW sets for each non-terminal in the grammar.

### Example Output (in ff.txt)
  ```rust
  Copy code
  FIRST sets:
  FIRST(A) = { ε, a }
  FIRST(C) = {  , ε }
  FIRST(S) = { ε,  , a }
  
  FOLLOW sets:
  FOLLOW(A) = {  , b, $ }
  FOLLOW(C) = {  , $ }
  FOLLOW(S) = { $ }
  ```
The ε symbol represents the empty string.
Each set is formatted with elements inside curly braces {}, separated by commas and a space after each comma.

## Running the Program

### Prerequisites
- Python 3.x installed on your system.

### Instructions
1. Clone or download this repository.
2. Ensure that the grammar file is formatted correctly (as explained in the Input Format).
3. Run the program using the following command:
  ```bash
  python ff_compute.py <grammar_file> <output_file>
  ```
Where:
- `<grammar_file>` is the input file containing the grammar (e.g., g.txt).
- `<output_file>` is the file where the FIRST and FOLLOW sets will be written (e.g., ff.txt).

### Example:
```bash
python ff_compute.py g.txt ff.txt
```
This command will read the grammar from g.txt and write the results to ff.txt.

## Example

Given the following grammar in g.txt:

```rust
S -> AC
A -> aAb
A -> 
C -> C c
C ->
```
The program will produce the following output in ff.txt:

```rust
Copy code
FIRST sets:
FIRST(A) = { ε, a }
FIRST(C) = {  , ε }
FIRST(S) = { ε,  , a }

FOLLOW sets:
FOLLOW(A) = {  , b, $ }
FOLLOW(C) = {  , $ }
FOLLOW(S) = { $ }
```
## Files

- ff_compute.py: The Python program that computes the FIRST and FOLLOW sets.
- README.md: This file, containing instructions on how to use the program.
- g.txt: Example grammar input file (create it as per the example provided above).
- ff.txt: Output file where the FIRST and FOLLOW sets will be written.
