start :-
    read_string(user_input, "\n", ",.!?();",_, X),
    process(X).

process("").
process("exit").
process("stop").
process(Sentence) :-
    sentenceToAtoms(Sentence,Atoms),
    writeList(Atoms),
    start.

sentenceToAtoms(Sentence,Atoms) :-
    split_string(Sentence, ' ', '', List),
    maplist(atom_string,Atoms,List).

writeList([]).
writeList([X|XS]):-
    write(X), nl,
    writeList(XS).

:- start.
