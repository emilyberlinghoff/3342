% Define the houses structure: house(Color, Nationality, Pet, Cigarette, Drink, Position)
houses([house(_, _, _, _, _, 1), house(_, _, _, _, _, 2), house(_, _, _, _, _, 3), house(_, _, _, _, _, 4), house(_, _, _, _, _, 5)]).

% Clues
solve(Houses) :-
    houses(Houses),

    member(house(red, english, _, _, _, _), Houses),
    member(house(_, spanish, dog, _, _, _), Houses),
    member(house(green, _, _, _, coffee, _), Houses),
    member(house(_, ukrainian, _, _, tea, _), Houses),
    next_to(house(green, _, _, _, _, _), house(white, _, _, _, _, _), Houses),
    member(house(_, _, _, winston, _, _), Houses),
    member(house(yellow, _, _, kool, _, _), Houses),
    Houses = [_, _, house(_, _, _, _, milk, 3), _, _],
    Houses = [house(_, norwegian, _, _, _, 1)|_],
    next_to(house(_, _, _, chesterfield, _, _), house(_, _, fox, _, _, _), Houses),
    next_to(house(_, _, _, kool, _, _), house(_, _, horse, _, _, _), Houses),
    member(house(_, _, _, luckystrike, juice, _), Houses),
    member(house(_, japanese, _, kent, _, _), Houses),
    next_to(house(_, norwegian, _, _, _, _), house(blue, _, _, _, _, _), Houses),
    member(house(_, _, zebra, _, _, _), Houses),
    member(house(_, _, _, _, water, _), Houses).

% Helper predicate for determining if two houses are next to each other
next_to(H1, H2, Houses) :-
    next_to_left(H1, H2, Houses).
next_to(H1, H2, Houses) :-
    next_to_left(H2, H1, Houses).

next_to_left(H1, H2, [H1, H2|_]).
next_to_left(H1, H2, [_|T]) :-
    next_to_left(H1, H2, T).

% Predicate definitions for queries
drink(X, Y) :- solve(Houses), member(house(_, X, _, _, Y, _), Houses).
pet(X, Y) :- solve(Houses), member(house(_, X, Y, _, _, _), Houses).
