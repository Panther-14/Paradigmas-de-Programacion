% Rellenar completamente la jarra pequeña si no está llena y queda suficiente
% agua.
aplica(e(P, M, G,A), e(3, M, G, NA)) :-
    A >= 3 - P,
    P < 3,
    NA is A - (3 - P).

% Rellenar completamente la jarra mediana si no está llena y queda suficiente
% agua.
aplica(e(P, M, G, A), e(P, 5, G, NA)) :-
    A >= 5 - M,
    M < 5,
    NA is A - (5 - M).

% Rellenar completamente la jarra grande si no está llena y queda suficiente
% agua.
aplica(e(P, M, G, A), e(P, M, 8, NA)) :-
    A >= 8 - G,
    G < 8,
    NA is A - (8 - G).

% Vaciar completamente la jarra pequeña si no está vacía.
aplica(e(P, M, G, A), e(0, M, G, A)) :- P > 0.

% Vaciar completamente la jarra mediana si no está vacía.
aplica(e(P, M, G, A), e(P, 0, G, A)) :- M > 0.

% Vaciar completamente la jarra grande si no está vacía.
aplica(e(P, M, G, A), e(P, M, 0, A)) :- G > 0.

% Si hay suficiente agua en la jarra pequeña, verterla en la jarra mediana
% hasta que se llene.
% (si a la mediana le cabe lo que hay en la pequeña)
aplica(e(P, M, G, A), e(0, NM, G, A)) :-
    P > 0,
    M < 5,
    5 - M >= P,
    NM is P + M.

% (si a la mediana *no* le cabe lo que hay en la pequeña)
aplica(e(P, M, G, A), e(NP, 5, G, A)) :-
    P > 0,
    M < 5,
    5 - M < P,
    NP is P - (5 - M).

% Si hay suficiente agua en la jarra mediana, verterla en la jarra pequeña
% hasta que se llene.
% (si a la pequeña le cabe lo que hay en la mediana)
aplica(e(P, M, G, A), e(NP, 0, G, A)) :-
    M > 0,
    P < 3,
    3 - P >= M,
    NP is P + M.

% (si a la pequeña *no* le cabe lo que hay en la mediana)
aplica(e(P, M, G, A), e(3, NM, G, A)) :-
    M > 0,
    P < 3,
    3 - P < M,
    NM is M - (3 - P).

% Si hay suficiente agua en la jarra mediana, verterla en la jarra grande
% hasta que se llene.
% (si a la grande le cabe lo que hay en la mediana)
aplica(e(P, M, G, A), e(NP, M, 0, A)) :-
    G > 0,
    P < 3,
    3 - P >= G,
    NP is P + G.

% (si a la grande *no* le cabe lo que hay en la mediana)
aplica(e(P, M, G, A), e(3, M, NG, A)) :-
    G > 0,
    P < 3,
    3 - P < G,
    NG is G - (3 - P).

% Vamos aplicando transiciones hasta que lleguemos a la configuración final.
% Evitamos entrar en bucles infinitos no añadiendo estados duplicados.
busca([e(P0, M0, G0, A0) | T], [e(P1, M1, 8, A1), s(P0, M0, G0, A0) | T]) :-
    aplica(e(P0, M0, G0, A0), e(P1, M1, 8, A1)),
    !.

busca([e(P0, M0, G0, A0) | T], ES) :-
    aplica(e(P0, M0, G0, A0), e(P1, M1, G1, A1)),
    \+ member(e(P1, M0, G1, A1), [e(P0, M0, G0, A0) | T]),
    busca([e(P1, M1, G1, A1), e(P0, M0, G0, A0) | T], ES).


% Punto de entrada.
soluciona_jarras(A, ES) :- busca([e(0, 0, 8, A)], ES).


% Para probarlo en Ciao y mostrar todas las soluciones:
% ensure_loaded('jarras.prolog').
% soluciona_jarras(9, ES), write(ES), nl, fail.

% Para calcular la solución que gasta el mínimo de agua, vamos ejecutando el
% predicado de entrada disminuyendo la cantidad de agua disponible cada vez,
% hasta que no se obtengan soluciones. La cantidad anterior a este punto será
% la mínima cantidad de agua. En nuestro caso es 9.

% Si tomamos la mínima cantidad de agua, la aumentamos en una unidad y
% mostramos las soluciones, podemos observar que existe una solución que gasta
% una mayor cantidad de agua, pero obtiene la solución en menos pasos:
% soluciona_jarras(10, ES), write(ES), nl, fail.
