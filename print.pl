/* Print predicate for maze */
:- [maze].

% char to represented open/closed
getChar(open, '  ').
getChar(closed, 'XX').

% clear terminal predicate
cls :- write('\33\[2J').

% first and last lines of the maze
print_line(Width) :-
    write('XX'),
    forall(between(1,Width, _), write('XX')),
    writeln('XX').

% printing different instructions depending on Mode
print_instr(interactive) :-
  writeln('Press arrow keys to move,'),
  writeln('q to quit, r to reset.'), nl.
print_instr(query) :-
  writeln('Type "a", "s", "w", or "d" to navigate maze'),
  writeln('Type "r" to reset'), nl.


% main print predicate
print_maze(Mode) :-
    cls,
    print_instr(Mode),
    currentPos(X,Y),
    mazeSize(Height, Width),
    print_line(Width),
    % for each line of the maze
    forall(between(1, Height, I),
            ((I == 1 -> write('  ') ;
                        write('XX')),
                % for each cell of the line
                forall(between(1, Width, J),
                            % check if currentPos == cell to be printed,
                            % if it is print OO as currentPos
                            ((X == I, J == Y) ->
                            write('OO') ;
                            % What is the type of the corresponding cell
                        (   maze(I, J, Type),
                            % What is the character of the type
                            getChar(Type, C),
                            write(C)))),
                (I == Height -> writeln('  ') ;
                writeln('XX')))),
    print_line(Width).
