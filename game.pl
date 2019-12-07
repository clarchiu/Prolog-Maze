:- [maze].
:- [key].
:- [print].

:- dynamic currentPos/2.
:- dynamic currentMazeSize/3.
:- retractall(currentPos(_,_)).
:- retractall(currentMazeSize(_,_,_)).

% Game state
currentPos(1, 1).
currentMazeSize(big,10,10).
goalPos(R,C) :-
  currentMazeSize(_,R,C).

% Helper function to initialize state
initialize(Size, Mode) :-
  currentPos(_,_),
  retractall(currentPos(_,_)),
  assert(currentPos(1,1)),
  mazeSize(Size,H,W),
  retract(currentMazeSize(_,_,_)),
  assert(currentMazeSize(Size,H,W)),
  print_maze(Size,Mode).

% To start the game and reset player position
play(Size, interactive) :-
  initialize(Size, interactive),
  key_press(_).
play(Size, query) :-
  initialize(Size, query).

% Interactive Mode
% - handle keyboard events
key_press(Key) :-
  map_key(Key),
    (Key == up -> move(up, interactive) ;
      Key == right -> move(right, interactive) ;
        Key == down -> move(down, interactive) ;
          Key == left -> move(left, interactive) ;
            Key == reset ->
              currentMazeSize(Size,_,_),
              play(Size,interactive);
              Key == quit -> writeln('Quiting!'), fail).

% Query mode
% - aliases for move functions
% - using wasd for query
d :- move(right, query).
a :- move(left, query).
w :- move(up, query).
s :- move(down, query).
r :-
  currentMazeSize(Size,_,_),
  play(Size,query).

% Win condition check
check_win(R,C) :-
  (goalPos(R,C) -> win; true).

win :-
  nl,
  writeln('You are a winner!'),
  false. % false to end the game

% Walkable check - check if move if valid
walkable(R,C) :-
  currentMazeSize(Size,H,W),
  R =< H, R > 0,
  C =< W, C > 0,
  maze(Size,R,C,open).

% Helper function to update position
update(R,C,R1,C1,Mode) :-
  retract(currentPos(R,C)),
  assert(currentPos(R1,C1)),
  currentMazeSize(Size,_,_),
  print_maze(Size,Mode).

% Move functions
% - moves the player left, right, up, down
% - move functions differ depending on game mode

% always check if win condition is true first
move(_,_) :-
  currentPos(R,C),
  check_win(R,C).

move(right, interactive) :-
  currentPos(R,C),
  C1 is C + 1,
  (walkable(R,C1) ->  % prolog if-then-else
    update(R,C,R,C1,interactive);
    true),
  key_press(_). % wait for next keyboard event
move(right, query) :-
  currentPos(R, C),
  C1 is C + 1,
  walkable(R,C1),
  update(R,C,R,C1,query).

move(left, interactive) :-
  currentPos(R, C),
  C1 is C - 1,
  (walkable(R,C1) -> % prolog if-then-else
    update(R,C,R,C1,interactive);
    true),
  key_press(_). % wait for next keyboard event
move(left, query) :-
  currentPos(R, C),
  C1 is C - 1,
  walkable(R,C1),
  update(R,C,R,C1,query).

move(up, interactive) :-
  currentPos(R, C),
  R1 is R - 1,
  (walkable(R1,C) -> % prolog if-then-else
    update(R,C,R1,C,interactive);
    true),
  key_press(_). % wait for next keyboard event
move(up, query) :-
  currentPos(R, C),
  R1 is R - 1,
  walkable(R1,C),
  update(R,C,R1,C,query).

move(down, interactive) :-
  currentPos(R, C),
  R1 is R + 1,
  (walkable(R1,C) -> % prolog if-then-else
    update(R,C,R1,C,interactive);
    true),
  key_press(_). % wait for next keyboard event
move(down, query) :-
  currentPos(R, C),
  R1 is R + 1,
  walkable(R1,C),
  update(R,C,R1,C,query).
