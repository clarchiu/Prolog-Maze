:- [maze].

:- dynamic currentPos/2.
:- retractall(currentPos(_,_)).

currentPos(1, 1).

play :-
  currentPos(_,_),
  retractall(currentPos(_,_)),
  assert(currentPos(1,1)).

move(right) :-
  currentPos(R, C),
  maze(R, C1, open),
  C1 is C + 1,
  C1 < 11,
  retract(currentPos(R,C)),
  assert(currentPos(R,C1)).
