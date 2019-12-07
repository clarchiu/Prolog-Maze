read_key([Code|Codes]) :-
   get_single_char(Code),
   read_pending_codes(user,Codes,[]).

read_keyatom(KAtom) :-
    read_key(Codes),
    ((Codes == [27,91,65];
      Codes == [27,91,66];
      Codes == [27,91,67];
      Codes == [27,91,68];
      Codes == [113];
      Codes == [114]) ->
        codes_keyatom(Codes, KAtom) ;
        %(writeln('Not a valid key pressed')),
        read_keyatom(KAtom)).

codes_keyatom([27,91,65],up)    :- !.
codes_keyatom([27,91,66],down)  :- !.
codes_keyatom([27,91,67],right) :- !.
codes_keyatom([27,91,68],left)  :- !.
codes_keyatom([113],quit)       :- !.
codes_keyatom([114],reset)      :- !.

% read_keyatom(KAtom) :-
%   read_key(Codes),
%   ((Codes == [27,91,65]; Codes == [27,91,66] ; Codes == [27,91,67] ; Codes == [27,91,68]) ->
%     codes_keyatom(Codes, KAtom)).
% read_keyatom(KAtom) :-
%   read_key(Codes),
%   Codes == [113],
%   codes_keyatom(Codes, KAtom).
% read_keyatom(KAtom) :-
%   read_key(Codes),
%   Codes == [114],
%   codes_keyatom(Codes, KAtom).
% read_keyatom(KAtom) :-
%   read_key(Codes),
%   Codes == [_],
%   read_keyatom(KAtom).
