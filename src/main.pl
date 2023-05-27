
start :-
    read_string(user_input, "\n", ",.!?();",_, X),
    process(X).

process("").
process("exit").
process("stop").
process("adeus").
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

:- [change],consult(change),start.
