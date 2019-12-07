% KB for diferent mazes
mazeSize(small, 5,5).
mazeSize(big, 10,10).


% - open index is printed as double spaces "  "
% - and closed is printed as double Xs "XX"

% small maze
maze(small, 1, 1, open).
maze(small, 1, 2, open).
maze(small, 1, 3, open).
maze(small, 1, 4, open).
maze(small, 1, 5, open).
maze(small, 2, 1, closed).
maze(small, 2, 2, closed).
maze(small, 2, 3, closed).
maze(small, 2, 4, closed).
maze(small, 2, 5, open).
maze(small, 3, 1, open).
maze(small, 3, 2, open).
maze(small, 3, 3, open).
maze(small, 3, 4, open).
maze(small, 3, 5, open).
maze(small, 4, 1, open).
maze(small, 4, 2, closed).
maze(small, 4, 3, closed).
maze(small, 4, 4, closed).
maze(small, 4, 5, closed).
maze(small, 5, 1, open).
maze(small, 5, 2, open).
maze(small, 5, 3, open).
maze(small, 5, 4, open).
maze(small, 5, 5, open).


% big maze
maze(big, 1, 1, open).
maze(big, 1, 2, open).
maze(big, 1, 3, closed).
maze(big, 1, 4, closed).
maze(big, 1, 5, closed).
maze(big, 1, 6, closed).
maze(big, 1, 7, open).
maze(big, 1, 8, open).
maze(big, 1, 9, open).
maze(big, 1, 10, open).
maze(big, 2, 1, open).
maze(big, 2, 2, open).
maze(big, 2, 3, open).
maze(big, 2, 4, open).
maze(big, 2, 5, open).
maze(big, 2, 6, closed).
maze(big, 2, 7, open).
maze(big, 2, 8, closed).
maze(big, 2, 9, open).
maze(big, 2, 10, open).
maze(big, 3, 1, open).
maze(big, 3, 2, open).
maze(big, 3, 3, open).
maze(big, 3, 4, closed).
maze(big, 3, 5, open).
maze(big, 3, 6, closed).
maze(big, 3, 7, open).
maze(big, 3, 8, open).
maze(big, 3, 9, open).
maze(big, 3, 10, open).
maze(big, 4, 1, open).
maze(big, 4, 2, closed).
maze(big, 4, 3, open).
maze(big, 4, 4, closed).
maze(big, 4, 5, open).
maze(big, 4, 6, closed).
maze(big, 4, 7, open).
maze(big, 4, 8, closed).
maze(big, 4, 9, closed).
maze(big, 4, 10, open).
maze(big, 5, 1, open).
maze(big, 5, 2, closed).
maze(big, 5, 3, open).
maze(big, 5, 4, closed).
maze(big, 5, 5, open).
maze(big, 5, 6, closed).
maze(big, 5, 7, open).
maze(big, 5, 8, closed).
maze(big, 5, 9, open).
maze(big, 5, 10, open).
maze(big, 6, 1, open).
maze(big, 6, 2, closed).
maze(big, 6, 3, closed).
maze(big, 6, 4, closed).
maze(big, 6, 5, open).
maze(big, 6, 6, closed).
maze(big, 6, 7, open).
maze(big, 6, 8, closed).
maze(big, 6, 9, open).
maze(big, 6, 10, closed).
maze(big, 7, 1, open).
maze(big, 7, 2, closed).
maze(big, 7, 3, open).
maze(big, 7, 4, open).
maze(big, 7, 5, open).
maze(big, 7, 6, closed).
maze(big, 7, 7, open).
maze(big, 7, 8, closed).
maze(big, 7, 9, open).
maze(big, 7, 10, closed).
maze(big, 8, 1, open).
maze(big, 8, 2, closed).
maze(big, 8, 3, open).
maze(big, 8, 4, closed).
maze(big, 8, 5, closed).
maze(big, 8, 6, closed).
maze(big, 8, 7, open).
maze(big, 8, 8, closed).
maze(big, 8, 9, open).
maze(big, 8, 10, open).
maze(big, 9, 1, closed).
maze(big, 9, 2, open).
maze(big, 9, 3, open).
maze(big, 9, 4, open).
maze(big, 9, 5, open).
maze(big, 9, 6, open).
maze(big, 9, 7, open).
maze(big, 9, 8, closed).
maze(big, 9, 9, open).
maze(big, 9, 10, open).
maze(big, 10, 1, open).
maze(big, 10, 2, open).
maze(big, 10, 3, open).
maze(big, 10, 4, open).
maze(big, 10, 5, closed).
maze(big, 10, 6, closed).
maze(big, 10, 7, closed).
maze(big, 10, 8, closed).
maze(big, 10, 9, open).
maze(big, 10, 10, open).

/* if trying to do random
:- dynamic maze/3.
:- retractall(maze(_,_,_)).
:- dynamic maze_size/2.
:- retractall(maze_size(_,_)).

maze_size(10,10).

create_maze(R, C) :-
    maze_size(R, C),
    forall(between(1, R, I),
           (forall(between(1, C, J),
                % randomize between open and closed
                (random_member(X, [open, closed]))),
            assert(maze(I, J, X)))).
*/
