start :-
    findall(Intro, introduction(Intro), Intros),
    maplist(writeIntroList,Intros),
    main,
    writePrompt(agente),
    finishing(F),writeList(F),nl.

main:-
    writePrompt(detetive),
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
    writePrompt(carlos),
    writeList(Out),
    main.

match(List,Left,Right,Right):-
    append(Left,_,List).
match([_|List],Left,Right,Out):-
    match(List,Left,Right,Out).

:- [helpers],[change].
:- start.
