:- [maze].
:- [key].
:- [print].

:- dynamic currentPos/2.
:- retractall(currentPos(_,_)).

currentPos(1, 1).

play :-
  currentPos(_,_),
  retractall(currentPos(_,_)),
  assert(currentPos(1,1)),
  print_maze,
  key_press(_).

move(right) :-
  currentPos(R, C),
  check_win(R,C),
  C1 is C + 1,
  C1 < 11,
  maze(R, C1, open),
  retract(currentPos(R,C)),
  assert(currentPos(R,C1)),
  print_maze,
  key_press(_).

move(left) :-
  currentPos(R, C),
  C1 is C - 1,
  C1 > 0,
  maze(R, C1, open),
  retract(currentPos(R,C)),
  assert(currentPos(R,C1)),
  print_maze,
  key_press(_).

move(down) :-
  currentPos(R, C),
  R1 is R + 1,
  R1 < 11,
  maze(R1, C, open),
  retract(currentPos(R,C)),
  assert(currentPos(R1,C)),
  print_maze,
  key_press(_).

move(up) :-
  currentPos(R, C),
  R1 is R - 1,
  R1 > 0,
  maze(R1, C, open),
  retract(currentPos(R,C)),
  assert(currentPos(R1,C)),
  print_maze,
  key_press(_).

check_win(R,C) :-
  ((R == 10, C == 10) -> cls, win ; true).

win :-  writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!'),
        writeln('You are a winner!').

key_press(Key) :-
  read_keyatom(Key),
    (Key == up -> move(up) ;
      Key == right -> move(right) ;
        Key == down -> move(down) ;
          Key == left -> move(left) ; fail).
