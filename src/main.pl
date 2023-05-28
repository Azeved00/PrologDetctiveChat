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
    respond(Match, Response),
    match(Atoms,Match,Response, Out),
    writeList(Out),
    start.

sentenceToAtoms(Sentence,Atoms) :-
    split_string(Sentence, ' ', '', List),
    maplist(atom_string,Atoms,List).

match(List,Left,Right,Out):-
    append(Prefix,Left,L),
    append(L,Sufix,List),
    append(Prefix,Right,L2),
    append(L2,Sufix,Out).

:- [helpers],[change].
:- start.
