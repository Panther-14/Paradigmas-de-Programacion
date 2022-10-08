camino(oradea, sibiu, 151).
camino(oradea, zerind, 71).
camino(zerind, arad, 75).
camino(arad, sibiu, 140).
camino(arad, timisoara, 118).
%camino(sibiu, fagaras, 99).
camino(sibiu, rimnicu, 80).
camino(timisoara, lugoj, 111).
camino(lugoj, mechadia, 70).
camino(mechadia, dobreta, 75).
camino(dobreta, craiova, 120).
camino(rimnicu, craiova, 146).

camino(craiova, pitesti, 138).
camino(fagaras, bucarest, 211).
camino(pitesti, bucarest, 101).
camino(bucarest, giurgiu, 90).
camino(bucarest, urziceni, 85).
camino(urziceni, hirsova, 98).
camino(urziceni, vaslui, 142).
camino(hirsova, eforie, 86).
camino(vaslui, iasi, 92).
camino(iasi, neamt, 87).

pertenece(X, [X | _]):- !.
pertenece(X, [_ | T]):-
    pertenece(X, T).

sucesor(Estado, Vistos, Nuevo, Costo):-
    camino(Estado, Nuevo, Costo),
    not(pertenece(Nuevo, Vistos)).
sucesor(Estado, Vistos, Nuevo, Costo):-
    camino(Nuevo, Estado, Costo),
    not(pertenece(Nuevo, Vistos)).

caminosSucs([], _, _, []):- !.
caminosSucs([Hs | Ts], Recorrido, Extra, [Rs | R2]):-
    caminosSucs(Ts, Recorrido, Extra, R2),
    append(Recorrido, [Extra], Rs).
caminosSucs(sucesores, recorrido, extra, Res).

sumarCostos(_, [], []):-!.
sumarCostos(Cantidad, [H | T], [Sum | Res]):-
    Sum is H + Cantidad,
    sumarCostos(Cantidad, T, Res).

amplitud(Ini, Meta, R):-
    amplitud([Ini], Meta, [[]] , R).

amplitud([Meta | _], Meta, [Rec | _], R2):-
    append(Rec, [Meta], R2).
amplitud([H | T], Meta, [VH | Resto], R):-
    bagof(Nuevo, C^sucesor(H, VH, Nuevo, C), Bag),
    append(T, Bag, NSu), %nueva cola de sucesores
    caminosSucs(Bag, VH, H, VistosSucs),
    append(Resto, VistosSucs, NVistos),  %nueva cola de recorrridos
    amplitud(NSu, Meta, NVistos,  R).
amplitud([_ | T], Meta, [_ | Resto], R):- %no tiene sucesores
    amplitud(T, Meta, Resto, R).

solucion(Ini, Meta, Res):-
    solucion(Ini, Meta, [Ini], 0, Res).

solucion(Meta, Meta, Pasos, Costo, [Pasos, Costo]).
solucion(Actual, Meta, Pasos, Costo, Res):-
    sucesor(Actual, Pasos, Nuevo, C2),
    C3 is Costo + C2,
    append(Pasos, [Nuevo], Pa2),
    solucion(Nuevo, Meta, Pa2, C3, Res).


