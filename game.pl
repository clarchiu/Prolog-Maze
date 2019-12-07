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
  read_keyatom(Key),
  (Key == up -> move(up) ;
    Key == right -> move(right) ;
      Key == down -> move(down) ;
        Key == left -> move(left) ; write('Not a valid key')).

move(right) :-
  currentPos(R, C),
  C1 is C + 1,
  C1 < 11,
  maze(R, C1, open),
  retract(currentPos(R,C)),
  assert(currentPos(R,C1)),
  print_maze,
  read_keyatom(Key),
  (Key == up -> move(up) ;
    Key == right -> move(right) ;
      Key == down -> move(down) ;
        Key == left -> move(left) ; fail).

move(left) :-
  currentPos(R, C),
  C1 is C - 1,
  C1 > 0,
  maze(R, C1, open),
  retract(currentPos(R,C)),
  assert(currentPos(R,C1)),
  print_maze,
  read_keyatom(Key),
  (Key == up -> move(up) ;
    Key == right -> move(right) ;
      Key == down -> move(down) ;
        Key == left -> move(left) ; fail).

move(down) :-
  currentPos(R, C),
  R1 is R + 1,
  R1 < 11,
  maze(R1, C, open),
  retract(currentPos(R,C)),
  assert(currentPos(R1,C)),
  print_maze,
  read_keyatom(Key),
  (Key == up -> move(up) ;
    Key == right -> move(right) ;
      Key == down -> move(down) ;
        Key == left -> move(left) ; write('Not a valid key')).

move(up) :-
  currentPos(R, C),
  R1 is R - 1,
  R1 > 0,
  maze(R1, C, open),
  retract(currentPos(R,C)),
  assert(currentPos(R1,C)),
  print_maze,
  read_keyatom(Key),
  (Key == up -> move(up) ;
    Key == right -> move(right) ;
      Key == down -> move(down) ;
        Key == left -> move(left) ; fail).

check_win(R,C) :-
  ((R == 10, C == 10) -> win ; true).

win :- writeln('Victory, you escaped the maze!').
