%10x10 maze
mazeSize(10,10).
% - open index is printed as double spaces "  "
% - and closed is printed as double Xs "XX"

maze(1, 1, open).
maze(1, 2, closed).
maze(1, 3, closed).
maze(1, 4, closed).
maze(1, 5, closed).
maze(1, 6, closed).
maze(1, 7, open).
maze(1, 8, open).
maze(1, 9, open).
maze(1, 10, open).
maze(2, 1, open).
maze(2, 2, open).
maze(2, 3, open).
maze(2, 4, open).
maze(2, 5, open).
maze(2, 6, closed).
maze(2, 7, open).
maze(2, 8, closed).
maze(2, 9, open).
maze(2, 10, open).
maze(3, 1, open).
maze(3, 2, open).
maze(3, 3, open).
maze(3, 4, closed).
maze(3, 5, open).
maze(3, 6, closed).
maze(3, 7, open).
maze(3, 8, open).
maze(3, 9, open).
maze(3, 10, open).
maze(4, 1, open).
maze(4, 2, closed).
maze(4, 3, open).
maze(4, 4, closed).
maze(4, 5, open).
maze(4, 6, closed).
maze(4, 7, open).
maze(4, 8, closed).
maze(4, 9, closed).
maze(4, 10, open).
maze(5, 1, open).
maze(5, 2, closed).
maze(5, 3, open).
maze(5, 4, closed).
maze(5, 5, open).
maze(5, 6, closed).
maze(5, 7, open).
maze(5, 8, closed).
maze(5, 9, open).
maze(5, 10, open).
maze(6, 1, open).
maze(6, 2, closed).
maze(6, 3, closed).
maze(6, 4, closed).
maze(6, 5, open).
maze(6, 6, closed).
maze(6, 7, open).
maze(6, 8, closed).
maze(6, 9, open).
maze(6, 10, closed).
maze(7, 1, open).
maze(7, 2, closed).
maze(7, 3, open).
maze(7, 4, open).
maze(7, 5, open).
maze(7, 6, closed).
maze(7, 7, open).
maze(7, 8, closed).
maze(7, 9, open).
maze(7, 10, closed).
maze(8, 1, open).
maze(8, 2, closed).
maze(8, 3, open).
maze(8, 4, closed).
maze(8, 5, closed).
maze(8, 6, closed).
maze(8, 7, open).
maze(8, 8, closed).
maze(8, 9, open).
maze(8, 10, open).
maze(9, 1, closed).
maze(9, 2, open).
maze(9, 3, open).
maze(9, 4, open).
maze(9, 5, open).
maze(9, 6, open).
maze(9, 7, open).
maze(9, 8, closed).
maze(9, 9, open).
maze(9, 10, open).
maze(10, 1, open).
maze(10, 2, open).
maze(10, 3, open).
maze(10, 4, open).
maze(10, 5, closed).
maze(10, 6, closed).
maze(10, 7, closed).
maze(10, 8, closed).
maze(10, 9, open).
maze(10, 10, open).

/* Print predicate for maze */

% char to represented open/closed
getChar(open, '  ').
getChar(closed, 'XX').

% first and last lines of the maze    
print_line(Width) :-
    write('XX'),
    forall(between(1,Width, _), write('XX')),
    write('XX').

% main print predicate    
print_maze :-
    mazeSize(Height, Width),
    print_line(Width), nl,
    % for each line of the maze    
    forall(between(1, Height, I),
            (write('XX'),
                % for each cell of the line
                forall(between(1, Width, J),
                            % What is the type of the corresponding cell
                        (   maze(I, J, Type),
                            % What is the character of the type
                            getChar(Type, C),
                            write(C))),
                writeln('XX'))),
    print_line(Width).

/* Reading key presses */

read_key([Code|Codes]) :-
   get_single_char(Code),
   read_pending_codes(user,Codes,[]).

read_keyatom(KAtom) :-
    write('Press arrow key to move'),
    read_key(Codes),
    codes_keyatom(Codes,KAtom).

codes_keyatom([27,91,65],up)    :- !.
codes_keyatom([27,91,66],down)  :- !.
codes_keyatom([27,91,67],right) :- !.
codes_keyatom([27,91,68],left)  :- !.

% ?- read_keyatom(Key).