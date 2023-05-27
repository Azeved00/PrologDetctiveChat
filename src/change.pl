
mae(vasco, isabel).
mae(rodrigo, helena).

pai(vasco, jose).
pai(rodrigo, francisco).

suspect_name(_, carlos).

respond([boa,tarde, N1|_], [chamo-me, N2]) :- change(N1, N2).

respond([foi, visto, na, N1|_],[nunca, estive, na, N1]).
respond([foi, visto, no, N1|_],[nunca, estive, no, N1]).
respond([foi, visto, em, N1|_],[nunca, estive, em, N1]).
% opa e evitar (não sei se é possivel) ter tantos casos identicos como estes de cima
respond([quando,viu,N1, N2, pela, ultima, vez], [nao, vejo, N1, N2, ha, meses]).
respond([conhece, o, N1|_], [N1, so, conheco, o, filho, da, N2]) :- mae(N1, N2).
respond([conhece, o, N1|_], [N1, so, conheco, o, filho, do, N2]) :- pai(N1, N2).
respond([conhece, o, N1|_], [nao, conheco, nenhum, N1]).
respond([conhece, a, N1|_], [nao, conheco, nenhuma, N1]).

respond([porque, estava|L1], [estava, ])

respond([consegue, N1|_], [prefiro, N1, na, presenca, do, meu, advogado]).

respond([confesse], [nunca, "!"]).

respond([onde,estava|_], [passei, o, dia, em, casa, dos, meus, sogros]).
respond(_, [por, favor, repita]).