factorial(0,0).
factorial(1,1).
factorial(X,Y):-
    X2 is X - 1,
    factorial(X2, Y2),
    Y is X * Y2.

p(a).
p(X):-
    q(X),r(X).
p(X):-s(X).

q(X):-
    s(X).

r(a).
r(b).

s(a).
s(b).
s(c).

u(d).

%padre(X,Y):-progenitor(X,Y),hombre(X),!.
%progenitor(benjamin,antonio).
%progenitor(maria,antonio).
%progenitor(samuel,benjamin).
%progenitor(alicia,benjamin).
%hombre(benjamin).
%hombre(samuel).

orgulloso(X):-padre(X,Y),recienNacido(Y).
padre(X,Y):-progenitor(X,Y),hombre(X).
progenitor(juan,maria).
progenitor(juan,cristina).
hombre(juan).
recienNacido(cristina).

imprimir([]).
imprimir([H|T]):-print(H),imprimir(T).

longTR(Xs,L):-long(Xs,0,L).
long([],Acc,Acc).
long([_|Xs],Acc,L):-
    Acc1 is Acc +1,
    long(Xs,Acc1,L).

miembro(X,[X|_]):-!.
miembro(X,[_|Ys]):-miembro(X,Ys).

insertarInicio(X,L,R):-mi_append([X],L,R).

mi_append([],L,L).
mi_append([X|L1],L2,[X|L3]):-mi_append(L1,L2,L3).

concatena([],L,L).
concatena([X|L1],L2,[X|L3]):-concatena(L1,L2,L3).

reverso([],[]).
reverso([X|Xs],Res):-
reverso(Xs,XsReverso),
mi_append(XsReverso,[X],Res).

remove_element(_, [], []).

remove_element(Y, [Y|Xs], Zs):-
          remove_element(Y, Xs, Zs), !.

remove_element(X, [Y|Xs], [Y|Zs]):-
          remove_element(X, Xs, Zs).

main():-
    read(X),
    read(Y),
    member(X,Y),
    write("true").
main:-
    write("false").
