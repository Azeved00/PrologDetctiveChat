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
    match(Atoms,Response),
    writePrompt(carlos),
    writeList(Response),
    main.

%unify(S,[],S).
%unify([Word|L1],[Word|L2],L2,Out):-unify(L1,L2,S).
%unify([_|L1],L2,S):-unify(L1,L2,S).

match([],[por, favor, repita]).
match(List,Response):-
    respond(List, Response).
match([_|List],Response):-
   match(List,Response).

:- [helpers],[change].
:- start.
