writeList([]):- nl.
writeList([X]):-
    write(X), nl.
writeList(['\n'|XS]):-
    nl,writeList(XS).
writeList([X,P|XS]):-
   member(P,['.',',',':',';','!','?','-','_']),
   write(X),write(P),
   writeList(XS).
writeList([X|XS]):-
    write(X), write(' '), 
    writeList(XS).

sentenceToAtoms(Sentence,Atoms) :-
    split_string(Sentence, ' ', '', List),
    maplist(atom_string,Atoms,List).

lAppend(L1-L2,L2-L3,L1-L3).
