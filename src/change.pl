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
introduction(['Hoje', temos, jorge,',',um,suspeito, de, X,'.']):-
    random_crime(X).
introduction(['O', detetive, vai, agora, conversar, com, ele, ',']).
introduction([mas, cuidado, que, ele, 'é', mal, encarado,'.']).
introduction(['Sobre',o,incidente,':']).
introduction(['Nao',sabemos,quando,foi,',',so,sabemos,que,foi,a,semana,passada]).
introduction(['Sabemos',tambem,que,ele,tem,'2',colegas,o,rodrigo,e,o,vasco]).
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
proposicao_espacial(a).

suspect_name(carlos).

alibi(segunda,[em, casa]).
alibi(terca,[no, trabalho]).
alibi(quarta,[no, bar]).
alibi(quinta,[no, trabalho]).
alibi(sexta,[no, trabalho]).
alibi(sabado,[no, bar]).
alibi(domingo,[na, casa,dos,meus,sogros]).

%Introductions
respond([boa, tarde, N1], [a, esta, hora, ja, e, boa, noite]):- suspect_name(N1).
respond([boa, tarde, N1], [chamo-me, N2]) :- 
    \+ suspect_name(N1), 
    suspect_name(N2).
respond([bom, dia, N1], [a, esta, hora, ja, e, boa, tarde]):-suspect_name(N1).
respond([bom, dia, N1], [chamo-me, N2]) :- 
    \+ suspect_name(N1),
    suspect_name(N2).
respond([ola, N1], [agradecia, um, tratamento, mais, formal]):-suspect_name(N1).
respond([ola, N1], [chamo-me, N2]) :- 
    \+ suspect_name(N1),
    suspect_name(N2).
respond([ola], [agradecia, um, tratamento, mais, formal]).

%Places
respond([onde,estava, Dia],[estava|Lugar]):-
    alibi(Dia,Lugar).
respond([foi, visto, P1 |N1],[nunca, estive, P1|N1]):- 
    proposicao_espacial(P1), 
    \+ alibi(_,N1).

respond([porque, estava|L1], L3) :- 
    append([estava|L1], [como, costumo, todos, os, domingos], L3).

%Coleagues
respond([quando,viu,N1, N2, pela, ultima, vez], [nao, vejo, N1, N2, ha, meses]).

respond([sabe, porque], [nao, sei, de, nada]).

respond([conhece, o, N1], [N1, so, conheco, o, filho, da, N2]) :- mae(N1, N2).
respond([conhece, o, N1], [N1, so, conheco, o, filho, do, N2]) :- pai(N1, N2).
respond([conhece, o, N1], [nao, conheco, nenhum, N1]) :- \+ colega(N1).

respond([X],[nao,vou,falar,de,um,amigo,sem,ele,estar,aqui]):-colega(X).

%Do stuff
respond([consegue, N1], [prefiro, N1, na, presenca, do, meu, advogado]).
respond([pode, N1], [prefiro, N1, na, presenca, do, meu, advogado]).

%NEVER
respond([confesse], [nunca, "!"]).

%Default
respond(_, [por, favor, repita]).
