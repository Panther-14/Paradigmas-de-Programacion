conecta(inicio,2).
conecta(1,7).
conecta(2,8).
conecta(2,3).
conecta(3,4).
conecta(3,9).
conecta(4,10).
conecta(8,9).
conecta(10,16).
conecta(16,22).
conecta(22,21).
conecta(21,15).
conecta(15,14).
conecta(14,13).
conecta(14,20).
conecta(13,7).
conecta(20,26).
conecta(26,27).
conecta(27,28).
conecta(6,5).
conecta(5,11).
conecta(11,17).
conecta(17,23).
conecta(23,29).
conecta(28,29).
conecta(28,34).
conecta(34,33).
conecta(34,35).
conecta(33,32).
conecta(32,31).
conecta(31,25).
conecta(25,19).
conecta(32,fin).
%
%Camino a recorrer(Primero en profundidad)
camino([fin|RestoDelCamino],[fin|RestoDelCamino]).
camino([PosActual|RestoDelCamino],Sol):-
    conectado(PosActual,PosSiguiente),
    \+ miembro(PosSiguiente,
        RestoDelCamino),
    camino([PosSiguiente,PosActual|RestoDelCamino],Sol).
%
%¿Con quien conecta?
conectado(Pos1, Pos2):- conecta(Pos1,Pos2).
conectado(Pos1,Pos2):- conecta(Pos2,Pos1).
%
%¿Es miembro de la lista?
miembro(X,[X|_]).
miembro(X,[_|Y]):- miembro(X,Y).
%
%Voltear una lista
reverso([],[]).
reverso([X|Xs],Res):-
    reverso(Xs,XsReverso),
    mi_append(XsReverso,[X],Res).
%
%Concatenar dos listas
mi_append([],L,L).
mi_append([X|L1],L2,[X|L3]):-mi_append(L1,L2,L3).
%
%Devuelve la cabeza de una lista
devuelveCabeza([C|_], C).
%
%Busqueda Primero en Amplitud
primeroEnAmplitud([[ Nodo | Camino ]|_] ,[[ Nodo | Camino ]]):-Nodo = fin,!.
primeroEnAmplitud([ Camino | Caminos ] ,Sol) :-
    extender(Camino , NuevosCaminos),
    append(Caminos , NuevosCaminos , Caminos1),
    primeroEnAmplitud(Caminos1 , Sol).

extender([ Nodo | Camino ], NuevosCaminos) :-
    bagof([ NuevoNodo , Nodo | Camino ],
          ( conectado(Nodo , NuevoNodo),
            \+ (member(NuevoNodo , [ Nodo | Camino ])))
         ,NuevosCaminos), !.
extender(_ ,[]).
%
%Ejecutar solucion Primero en profundidad
sol:-
    camino([inicio], Sol), write(Sol),!.
%
%Ejecutar solucion Primero en profundidad(Regresar la lista al revés)
sol1:-
    camino([inicio], Sol),reverso(Sol,Sol1), write(Sol1),!.
%
%Ejecutar solucion Primero en Amplitud
sol2:-
    primeroEnAmplitud([[ inicio ]] , Sol),devuelveCabeza(Sol,Sol1),write(Sol1).
%
%Ejecutar solucion Primero en Amplitud(Regresar la lista al revés)
sol3:-
    primeroEnAmplitud([[ inicio ]] , Sol),devuelveCabeza(Sol,Sol1),reverso(Sol1,Sol2),write(Sol2).
%
%Fin del archivo