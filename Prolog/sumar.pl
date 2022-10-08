suma_lista([],0).
suma_lista([H|T],L):-
    suma_lista(T,L2), L is L2 + H.

ordenada([]).
ordenada([X]).
ordenada([X,Y|L]) :- X=<Y,ordenada(L).

lista(N,L):-lista_aux(N,N,L).
lista_aux(_,0,[]).
lista_aux(N,M,[N|L]):-M > 0, M1 is M-1, lista_aux(N,M1,L).

contador(Inicio,_,Inicio).
contador(Inicio,Hasta,Valor):-
    Inicio < Hasta,
    Inicio2 is Inicio+1,
    contador(Inicio2,Hasta,Valor).
