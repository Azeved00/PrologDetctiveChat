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
    %match(Atoms,Match,Pattern, Out),
    writeList(Response),
    start.

sentenceToAtoms(Sentence,Atoms) :-
    split_string(Sentence, ' ', '', List),
    maplist(atom_string,Atoms,List).

match(X,[],Pattern, Out):- 
	lAppend(Pattern,X,Out), !.
match([Word|Sentence],[Word|Left],Right,[Word|Out]):- 
	match(Sentence,Left,Right,Out).
match([Word|Sentence],[Other|Left],Right,[Word|Out]):-
    Word \= Other,
	match(Sentence,[Other|Left],Right,Out).

:- [helpers],[change].
:- start.
