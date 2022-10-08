devuelveCabeza([C|L], C).
devuelveSegundo([C|L], L).
primero([X|_], X).
segundo([X,Y|_],X).
resto([_|L],L).
elemento([X|R],X). %A esto se le llama caso base
elemento([X|R],Y):-elemento(R,Y).
rango(N,'nivel 1'):-N > 0, N =< 2, !.%Ver que pasa si se quita el corte
rango(N,'nivel 2'):-N > 0, N=< 2.
rango(N,'nivel 3').

aridad([],0).
aridad([X|R],N):-aridad(R,Z),N is Z+1.

concatena([],L,L).
concatena([X|L1],L2,[X|L3]):-concatena(L1,L2,L3).

duplicar([],[]).
duplicar([X],[X,X]).
duplicar([X|L1],[X,X|L2]):-duplicar(L1,L2).

buscar_ultimo([X],X).
buscar_ultimo([_|R],L1):-buscar_ultimo(R,L1).

quita_dos_ultimos([X|Y],[]).
quita_dos_ultimos([X|R1],[X|R2]):-quita_dos_ultimos(R1,R2).

quita_elemento(X,[X|Xs],Xs).
quita_elemento(X,[Y|Ys],[Y|Zs]):-quita_elemento(X,Ys,Zs).

dos_ultimos([X,Y],[X,Y]).
dos_ultimos([_|R],[X|R2]):-dos_ultimos(R1,R2).

mi_append([],L,L).
mi_append([X|L1],L2,[X|L3]):-mi_append(L1,L2,L3).

ordenda([]).%:-write('true').
ordenada([X]).%:-write('true').
%ordenada(L):-[X|_]< [X,Y|_],ordenada(_|S).

list_sum([],0).
list_sum([C|R],Total):-list_sum(R,Suma),Total is C+Suma.

longTR([],0).
longTR([X|Y],L):-longTR(Y,L1),L is L1+1.

%slice([X|Y],0,0,[]).
%slice([X],0,0,L).
%slice([X|Y],I,F,L):-slice(Y,I,F,L), Y is F.

inc([],0).
inc([X|R],L):-inc(R,L1),L is L1 + R.

slice([X|_],1,1,[X]).
slice([X|Xs],1,K,[X|Ys]) :- K > 1, K1 is K - 1, slice(Xs,1,K1,Ys).
slice([_|Xs],I,K,Ys) :- I > 1, I1 is I - 1, K1 is K - 1, slice(Xs,I1,K1,Ys).


















