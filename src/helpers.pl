writeList([]).
writeList([X]):-
    write(X), nl,
    writeList([]).
writeList([X|XS]):-
    write(X), write(' '), 
    writeList(XS).

lAppend(L1-L2,L2-L3,L1-L3).
