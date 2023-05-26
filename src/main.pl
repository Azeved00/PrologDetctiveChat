:- [change].

start :-
    %consult(change),
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

<<<<<<< HEAD
:- consult(change).
=======
respond([boa,tarde, N1|_], [chamo-me, N2]) :- change(N1, N2).
respond(_, [por, favor, repita]).

>>>>>>> refs/remotes/origin/main
:- start.

%   NOTAS !!!
% (mais notas no outro ficheiro)

% não soube como fazer com que várias palavras sejam iguais: por exemplo, comportamento com "bom dia", "boa tarde", e "olá" é o mesmo
% e "estava e estavas" também
% isto foi sugerido pelo Professor e faz todo o sentido