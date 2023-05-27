change([],[]).
change(pedro, vasco).
change(jose, susana).


respond([boa,tarde, N1|_], [chamo-me, N2]) :- change(N1, N2).

respond([foi, visto, na, N1|_],[nunca, estive, na, N1]).
respond([foi, visto, no, N1|_],[nunca, estive, no, N1]).
respond([foi, visto, em, N1|_],[nunca, estive, em, N1]).
% opa e evitar (não sei se é possivel) ter tantos casos identicos como estes de cima
respond([quando,viu,N1, N2, pela, ultima, vez], [nao, vejo, N1, N2, ha, meses]).
respond([conhece, o, N1|_], [N1, so, conheco, o, filho, da, N2]) :- change(N1, N2).

respond([confesse], [nunca, "!"]).

respond([onde,estava|_], [passei, o, dia, em, casa, dos, meus, sogros]).
% num exemplo como o de cima o professor sugeriu criarmos uma lista de frases onde ele pode escolher aleatoriamente. 
% Não encontrei nada na internet, se encontrares ou souberes como fazer era interessante implementar
respond(_, [por, favor, repita]).
