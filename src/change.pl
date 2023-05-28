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
introduction(['O', jorge, 'é', um, suspeito, de, X, '.']):-
    random_crime(X).
introduction(['O', detetive, vai, agora, conversar, com, ele, ',']).
introduction([mas, cuidado, que, ele, 'é', mal, encarado,'.']).
introduction(['Sobre',o,incidente,':']).
introduction(['Não',sabemos,quando,foi,',','só',sabemos,que,foi,na,semana,passada,'.']).
introduction(['Sabemos','também',que,ele,tem,'2',colegas,':',o,rodrigo,e,o,vasco,'.']).
introduction(['Boa', sorte,'!']).

%---------------------Finalizacao------------------------
finishing():-
    finishing1(X1),
    writePrompt(agente),
    writeList(X1),
    
    writePrompt(detetive),
    read_string(user_input, "\n", ",.!?();",_, V),
    finishing2(V,X2),
    writePrompt(agente),
    writeList(X2),
    
    finishing3(X3),
    writePrompt(agente),
    writeList(X3),

    finishing4(X4),
    writePrompt(agente),
    writeList(X4),nl.


finishing1(['Entao',detetive,o,que,achou,'?']).

finishing2(X,[X,'?', a,serio,'?']).
finishing3(['Nao',estava,a,espera,desse,resultado,mas,se,o,diz,entao,e,porque,e,verdade,'.']).
finishing4(['Obrigado',pela,ajuda,agente,',',ate,a,proxima,'!']).

%-----------------------Conversa-------------------------
colega(rodrigo).
colega(vasco).

mae(rodrigo, helena).
pai(vasco, jose).

proposicao(em).
proposicao(na).
proposicao(no).
proposicao(a).

suspect_name(carlos).

alibi(segunda,[em, casa]).
alibi(terca,[no, trabalho]).
alibi(quarta,[no, bar]).
alibi(quinta,[no, trabalho]).
alibi(sexta,[no, trabalho]).
alibi(sabado,[no, bar]).
alibi(domingo,[na, casa,dos,meus,sogros]).

qual(dia).
qual(roubo).
qual(assassinato).
qual(vandalismo).
qual(pessoa).

%Introductions
respond([boa, tarde, N1|_], ['A', esta, hora, 'já', 'é', boa, noite, '...']):- suspect_name(N1).
respond([boa, tarde, N1|_], ['Chamo-me', N2]) :- 
    \+ suspect_name(N1), 
    suspect_name(N2).
respond([boa, tarde|_], ['A', esta, hora, 'já', 'é', boa, noite, '...']).
respond([bom, dia, N1|_], ['A', esta, hora, 'já', 'é', boa, tarde, '...']):- suspect_name(N1).
respond([bom, dia, N1|_], ['Chamo-me', N2]) :- 
    \+ suspect_name(N1),
    suspect_name(N2).
respond([bom, dia|_], ['A', esta, hora, 'já', 'é', boa, tarde, '...']).
respond([ola, N1|_], ['Agradecia', um, tratamento, mais, formal, '.']):- suspect_name(N1).
respond([ola, N1|_], ['Chamo-me', N2]) :- 
    \+ suspect_name(N1),
    suspect_name(N2).
respond([ola|_], ['Agradecia', um, tratamento, mais, formal, '.']).

%Places
respond([onde,estava, P, Dia|_],['Estava'|Lugar]):-
    proposicao(P), alibi(Dia,Lugar).
respond([foi, visto, P1|N1],['Nunca', estive, P1|N1]):- 
    proposicao(P1), 
    \+ alibi(_,N1).

respond([porque, estava|L1], L3) :- append(['Estava'|L1], [como, costumo, todos, os, domingos,'.'], L3).

%Colleagues
respond([quando,viu,N1, N2, pela, ultima, vez|_], ['Não', vejo, N1, N2, 'há', meses,'.']).

respond([sabe, porque|_], ['Não', sei, de, nada,'.']).

respond([conhece, o, N1|_], [N1, 'só', 'conheço', o, filho, da, N2,'.']) :- mae(N1, N2).
respond([conhece, o, N1|_], [N1, 'só', 'conheço', o, filho, do, N2,'.']) :- pai(N1, N2).
respond([conhece, o, N1|_], ['não', 'conheço', nenhum, N1,'.']) :- \+ colega(N1).

respond([X|_],[nao,falarei,de,um,amigo,na,'ausência',dele]):-colega(X).

%Do stuff
respond([consegue, N1|_], ['Prefiro', N1, na, 'presença', do, meu, advogado, '.']).
respond([pode, N1|_], ['Prefiro', N1, na, 'presença', do, meu, advogado, '.']).
respond([como, justifica|_], ['Há', coisas, que ,'não', precisam, de, 'justificação.']).

%NEVER
respond([crime|_], ['O', 'único', crime, cometido, foi, o, tempo, que, me, fizeram, esperar, '.']).
respond([confesse|_], [nunca, '!']).
respond([X|_], ['Qual', X,'?']) :- qual(X).

