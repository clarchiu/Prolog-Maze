% Handler for keyboard events

% reads a character from keyboard input
get_key([Code|Codes]) :-
   get_single_char(Code),
   read_pending_codes(user,Codes,[]).

% maps prolog character representation to program specific atoms
map_key(KAtom) :-
    get_key(Codes),
    ((Codes == [27,91,65];
      Codes == [27,91,66];
      Codes == [27,91,67];
      Codes == [27,91,68];
      Codes == [113];
      Codes == [114]) ->
        key_to_atom(Codes, KAtom) ;
        %(writeln('Not a valid key pressed')),
        map_key(KAtom)).

key_to_atom([27,91,65],up)    :- !.
key_to_atom([27,91,66],down)  :- !.
key_to_atom([27,91,67],right) :- !.
key_to_atom([27,91,68],left)  :- !.
key_to_atom([113],quit)       :- !.
key_to_atom([114],reset)      :- !.
