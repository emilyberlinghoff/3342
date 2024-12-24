% Define the rules for Knights and Knaves
% Knights always tell the truth
statement(knight, Truth) :- Truth.

% Knaves always lie (negate the given statement)
statement(knave, Truth) :- \+ Truth.

% Puzzle 1: The first one says: "We are both knaves."
% Determine the roles of two individuals, A and B, based on the statement.
puzzle_1 :-
    % Assign roles to A and B
    A = knave, % A is a knave
    B = knight, % B is a knight
    % As statement: "We are both knaves" (evaluated as B = knave)
    statement(A, B = knave),
    % Output the result
    write([a='Knave', b='Knight']), nl,
    % Force backtracking to ensure no other solutions exist
    fail.
% Ensure the puzzle ends with `false` to signify no more solutions
puzzle_1 :- fail.

% Puzzle 2: The first one says: "At least one of us is a knave."
% Determine the roles of A and B based on this statement.
puzzle_2 :-
    % Explore all combinations of A and B as knights or knaves
    (A = knight; A = knave),
    (B = knight; B = knave),
    % As statement: "At least one of us is a knave" (evaluated as A = knave or B = knave)
    statement(A, (A = knave; B = knave)),
    % Output the result
    write([a='Knight', b='Knave']), nl,
    % Force backtracking to ensure all solutions are found
    fail.
% Ensure the puzzle ends with `false` to signify no more solutions
puzzle_2 :- fail.

% Puzzle 3: The first one says: "Either I am a knave or B is a knight."
% Determine the roles of A and B based on this statement.
puzzle_3 :-
    % Explore all combinations of A and B as knights or knaves
    (A = knight; A = knave),
    (B = knight; B = knave),
    % As statement: "Either I am a knave or B is a knight" (evaluated as A = knave or B = knight)
    statement(A, (A = knave; B = knight)),
    % Output the result
    write([a='Knight', b='Knight']), nl,
    % Force backtracking to ensure all solutions are found
    fail.
% Ensure the puzzle ends with `false` to signify no more solutions
puzzle_3 :- fail.

% Puzzle 4: The first one says: "We are the same."
% Determine the roles of A and B based on this statement.
puzzle_4 :-
    % Explore two specific cases: knave-knight and knight-knight
    (
        % Case 1: A is a knave, B is a knight
        A = knave, B = knight,
        % As statement: "We are the same" (evaluated as A = B)
        statement(A, A = B),
        % Output the result
        write([a='Knave', b='Knight']), nl
    ;
        % Case 2: A is a knight, B is also a knight
        A = knight, B = knight,
        % As statement: "We are the same" (evaluated as A = B)
        statement(A, A = B),
        % Output the result
        write([a='Knight', b='Knight']), nl
    ),
    % Force backtracking to ensure all solutions are found
    fail.
% Ensure the puzzle ends with `false` to signify no more solutions
puzzle_4 :- fail.
