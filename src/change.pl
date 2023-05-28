%----------------------Introducao------------------------
crime(roubar).
crime(vandalizar).
crime(matar).
crime(hackear).

random_crime(X) :-
    findall(Rule, crime(Rule), Rules),
    length(Rules, Length),
    random(0, Length, RandomIndex),
    nth0(RandomIndex, Rules, X).

introduction(['Bom', dia, detetive,',']).
introduction(['Hoje', temos, carlos,um,suspeito, de, X,'.']):-
    random_crime(X).
introduction(['O', detetive, vai, agora, conversar, com, ele, '.']).
introduction([mas, cuidado, que, ele, 'é', mal, encarado,'.']).
introduction(['Boa', sorte,'.']).

%---------------------Finalizacao------------------------
finishing(['Adeus']).
%-----------------------Conversa-------------------------
colega(rodrigo).
colega(vasco).

mae(rodrigo, helena).
pai(vasco, jose).

proposicao_espacial(em).
proposicao_espacial(na).
proposicao_espacial(no).

suspect_name(_, carlos).

%Introductions
respond([boa, tarde, carlos], [a, esta, hora, ja, e, boa, noite]).
respond([boa, tarde, N1], [chamo-me, N2]) :- suspect_name(N1, N2).
respond([bom, dia, carlos], [a, esta, hora, ja, e, boa, tarde]).
respond([bom, dia, N1], [chamo-me, N2]) :- suspect_name(N1, N2).
respond([ola, carlos], [agradecia, um, tratamento, mais, formal]).
respond([ola, N1], [chamo-me, N2]) :- suspect_name(N1, N2).
respond([ola], [agradecia, um, tratamento, mais, formal]).

%Places
respond([foi, visto, P1, N1],[nunca, estive, P1, N1]) :- proposicao_espacial(P1).
respond([foi, visto, N1],[nunca, estive, N1]).
respond([onde,estava], [passei, o, dia, em, casa, dos, meus, sogros]).

%respond([porque, estava|L1], L3) :- 
%    append([estava], L1, L2), 
%    append(L2, [como, costumo, todos, os, domingos], L3).

%Coleagues
respond([quando,viu,N1, N2, pela, ultima, vez], [nao, vejo, N1, N2, ha, meses]).

respond([sabe, porque], [nao, sei, de, nada]).

respond([conhece, o, N1], [N1, so, conheco, o, filho, da, N2]) :- mae(N1, N2).
respond([conhece, o, N1], [N1, so, conheco, o, filho, do, N2]) :- pai(N1, N2).
respond([conhece, o, N1], [nao, conheco, nenhum, N1]).

respond([X],[nao,vou,falar,de,um,amigo,sem,ele,estar,aqui]):-colega(X).

%Do stuff
respond([consegue, N1], [prefiro, N1, na, presenca, do, meu, advogado]).
respond([pode, N1], [prefiro, N1, na, presenca, do, meu, advogado]).

%NEVER
respond([confesse], [nunca, "!"]).

%Default
respond(_, [por, favor, repita]).
