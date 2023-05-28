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

introduction(['Bom', dia, detetive,',','\n',
        'Hoje', temos, carlos,um,suspeito, de, X,'.','\n',
        'O', detetive, vai, agora, conversar, com, ele, '.','\n', 
        mas, cuidado, que, ele, 'é', mal, encarado,'.','\n',
        'Boa', sorte,'.']):-
    random_crime(X).

%---------------------Finalizacao------------------------
%-----------------------Conversa-------------------------
mae(vasco, isabel).
mae(rodrigo, helena).

pai(vasco, jose).
pai(rodrigo, francisco).

proposicao_espacial(em).
proposicao_espacial(na).
proposicao_espacial(no).

suspect_name(_, carlos).

respond([boa, tarde, carlos], [a, esta, hora, ja, e, boa, noite]).
respond([boa, tarde, N1], [chamo-me, N2]) :- suspect_name(N1, N2).
respond([bom, dia, carlos], [a, esta, hora, ja, e, boa, tarde]).
respond([bom, dia, N1], [chamo-me, N2]) :- suspect_name(N1, N2).
respond([ola], [agradecia, um, tratamento, mais, formal]).
respond([ola, carlos], [agradecia, um, tratamento, mais, formal]).
respond([ola, N1], [chamo-me, N2]) :- suspect_name(N1, N2).

respond([foi, visto, P1, N1],[nunca, estive, P1, N1]) :- proposicao_espacial(P1).


respond([foi, visto, a, N1],[nunca, estive, em, N1]).

respond([quando,viu,N1, N2, pela, ultima, vez], [nao, vejo, N1, N2, ha, meses]).

respond([sabe, porque], [nao, sei, de, nada]).


respond([conhece, o, N1], [N1, so, conheco, o, filho, da, N2]) :- mae(N1, N2).
respond([conhece, o, N1], [N1, so, conheco, o, filho, do, N2]) :- pai(N1, N2).
respond([conhece, o, N1], [nao, conheco, nenhum, N1]).

respond([porque, estava|L1], L3) :- append([estava], L1, L2), append(L2, [como, costumo, todos, os, domingos], L3).

respond([consegue, N1], [prefiro, N1, na, presenca, do, meu, advogado]).
respond([pode, N1], [prefiro, N1, na, presenca, do, meu, advogado]).

respond([confesse], [nunca, "!"]).

respond([onde,estava], [passei, o, dia, em, casa, dos, meus, sogros]).
%respond(_, [por, favor, repita]).
