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
  maze(R, C1, open),
  C1 is C + 1,
  C1 < 11,
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
  maze(R, C1, open),
  C1 is C - 1,
  C1 > 0,
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
  maze(R1, C, open),
  R1 is R + 1,
  R1 < 11,
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
  maze(R1, C, open),
  R1 is R - 1,
  R1 > 0,
  retract(currentPos(R,C)),
  assert(currentPos(R1,C)),
  print_maze,
  read_keyatom(Key),
  (Key == up -> move(up) ;
    Key == right -> move(right) ;
      Key == down -> move(down) ;
        Key == left -> move(left) ; fail).
