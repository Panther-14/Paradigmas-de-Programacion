
% Escribe un conjunto de predicados que se llame insertarInicio y reciba
% tres parámetros: el elemento X a insertar, la lista donde se va a
% insertar y otra variable donde se unifica el resultado de la nueva
% lista.

%Recuerda incorporar el siguiente predicado:

insertarInicio(X,L,R):-mi_append([X],L,R).

mi_append([],L,L).
mi_append([X|L1],L2,[X|L3]):-mi_append(L1,L2,L3).


main():- read(X), read(L),insertarInicio(X, L, R),  write(R).
