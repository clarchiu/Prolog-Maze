:- [maze].
:- [key].
:- [print].

:- dynamic currentPos/2.
:- retractall(currentPos(_,_)).

currentPos(1, 1).
goalPos(10,10).

% To start the game and reset player position
play(interactive) :-
  currentPos(_,_),
  retractall(currentPos(_,_)),
  assert(currentPos(1,1)),
  print_maze(interactive),
  key_press(_).
play(query) :-
  currentPos(_,_),
  retractall(currentPos(_,_)),
  assert(currentPos(1,1)),
  print_maze(query).

% Win condition check
check_win(R,C) :-
  (goalPos(R,C) -> win ; true).

win :-
  nl,
  writeln('You are a winner!'),
  false. %false in order to end the game

% Interactive Mode
% - handle keyboard events
key_press(Key) :-
  read_keyatom(Key),
    (Key == up -> move(up, interactive) ;
      Key == right -> move(right, interactive) ;
        Key == down -> move(down, interactive) ;
          Key == left -> move(left, interactive) ;
            Key == reset -> play(interactive);
              Key == quit -> writeln('Quiting!'), fail).

% Query mode
% - aliases for move functions
% - using wasd for query
d :- move(right, query).
a :- move(left, query).
w :- move(up, query).
s :- move(down, query).
r :- play(query).

% Helper function to update position
update(R,C,R1,C1,Mode) :-
  retract(currentPos(R,C)),
  assert(currentPos(R1,C1)),
  print_maze(Mode).

% Move functions
% - moves the player left, right, up, down
% - move functions differ depending on game mode
move(right, interactive) :-
  currentPos(R,C),
  check_win(R,C),
  C1 is C + 1,
  ((maze(R, C1, open), C1 < 11) ->  % prolog if-then-else
      update(R,C,R,C1,interactive);
      true),
  key_press(_). % wait for next keyboard event
move(right, query) :-
  currentPos(R, C),
  check_win(R,C),
  C1 is C + 1,
  C1 < 11,
  maze(R, C1, open),
  update(R,C,R,C1,query).

move(left, interactive) :-
  currentPos(R, C),
  check_win(R,C),
  C1 is C - 1,
  ((maze(R, C1, open), C1 > 0) -> % prolog if-then-else
    update(R,C,R,C1,interactive);
    true),
  key_press(_). % wait for next keyboard event
move(left, query) :-
  currentPos(R, C),
  check_win(R,C),
  C1 is C - 1,
  C1 > 0,
  maze(R, C1, open),
  update(R,C,R,C1,query).

move(up, interactive) :-
  currentPos(R, C),
  check_win(R,C),
  R1 is R - 1,
  ((maze(R1, C, open), R1 > 0) -> % prolog if-then-else
    update(R,C,R1,C,interactive);
    true),
  key_press(_). % wait for next keyboard event
move(up, query) :-
  currentPos(R, C),
  check_win(R,C),
  R1 is R - 1,
  R1 > 0,
  maze(R1, C, open),
  update(R,C,R1,C,query).

move(down, interactive) :-
  currentPos(R, C),
  check_win(R,C),
  R1 is R + 1,
  ((maze(R1, C, open), R1 < 11) -> % prolog if-then-else
    update(R,C,R1,C,interactive);
    true),
  key_press(_). % wait for next keyboard event
move(down, query) :-
  currentPos(R, C),
  check_win(R,C),
  R1 is R + 1,
  R1 < 11,
  maze(R1, C, open),
  update(R,C,R1,C,query).
