writeList([]):- nl.
writeList([X]):-
    write(X), nl.
writeList(['\n'|XS]):-
    nl,writeList(XS).
writeList([X,P|XS]):-
   member(P,['.',',',':',';','!','?','-','_']),
   write(X),write(P),write(' '),
   writeList(XS).
writeList([X|XS]):-
    write(X), write(' '), 
    writeList(XS).

sentenceToAtoms(Sentence,Atoms) :-
    split_string(Sentence, ' ', '', List),
    maplist(atom_string,Atoms,List).

writePrompt(agente):-
    write('Agente       -> ').
writePrompt(detetive):-
    write('Detetive(you)-> ').
writePrompt(carlos):-
    write('Carlos       -> ').

writeIntroList(List):-
    writePrompt(agente),
    writeList(List).
