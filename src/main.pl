start :-
    read_string(user_input, "\n", ",.!?();",_, X),
    process(X).

process("").
process("exit").
process("stop").
process(Sentence) :-
    sentenceToAtoms(Sentence,Atoms),
   %writeList(Atoms),
    respond(Atoms, Response),
    writeList(Response),
    start.

sentenceToAtoms(Sentence,Atoms) :-
    split_string(Sentence, ' ', '', List),
    maplist(atom_string,Atoms,List).

writeList([]).
writeList([X]):-
    write(X), nl,
    writeList([]).
writeList([X|XS]):-
    write(X), write(' '), 
    writeList(XS).

respond([boa,tarde, N1|_], [chamo-me, N2]) :- change(N1, N2).
respond(_, [por, favor, repita]).

change([],[]).
change(pedro, vasco).

:- start.
