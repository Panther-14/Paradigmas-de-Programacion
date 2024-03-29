% DE JARRA GRANDE A MEDIANA %
% CASO 1: EXISTE SUFICIENTE CONTENIDO EN LA JARRA DE ORIGEN PARA%
%VACIARLA Y MOVER SU CONTENIDO A LA JARRA DE DESTINO %
accion([A, B, C], [0, B2, C]):- RESTO is (5 - B), A =< RESTO, B2 is B + A, B2 =< 5, B2 \== B.
% DE JARRA GRANDE A MEDIANA %
% CASO 2: EL CONTENIDO DE LA JARRA DE ORIGEN ES M�S DEL NECESARIO PARA
%LLENAR LA JARRA DE DESTINO, HAY RESTANTE EN LA JARRA DE ORIGEN %
accion([A, B, C], [A2, 5, C]):- RESTO is (5 - B), A > RESTO, A2 is A - RESTO, A2 =< 8, A2 \==
A.
% DE JARRA GRANDE A CHICA %
accion([A, B, C], [0, B, C2]):- RESTO is (3 - C), A =< RESTO, C2 is C + A, C2 =< 3, C \== C.
% EL RESTO ES LA CAPACIDAD DE LA JARRA DE DESTINO MENOS EL CONTENIDO
%ACTUAL, SI LA JARRA DE ORIGEN POSEE MENOR O IGUAL CANTIDAD DE LA%
%NECESARIA, SE VAC�A Y MUEVE SU CONTENIDO A LA JARRA DE DESTINO %
accion([A, B, C], [A2, B, 3]):- RESTO is (3 - C), A > RESTO, A2 is A - RESTO, A2 =< 8, A2 \==
A.
% SI LA JARRA DE ORIGEN POSEE M�S DEL CONTENIDO NECESARIO, MUEVE LA
%CANTIDAD NECESARIA PARA EL LLENADO DE LA JARRA DE DESTINO Y ALMACENA
%EL CONTENIDO RESTANTE PARA PR�XIMOS MOVIMIENTOS %
% DE JARRA MEDIANA A GRANDE %
accion([A, B, C], [A2, 0, C]):- RESTO is (8 - A), B =< RESTO, A2 is A + B, A2 =< 8, A2 \== A.
accion([A, B, C], [8, B2, C]):- RESTO is (8 - A), B > RESTO, B2 is B - RESTO, B2 =< 5, B2 \==
B.

% DE JARRA MEDIANA A CHICA %
accion([A, B, C], [A, 0, C2]):- RESTO is (3 - C), B =< RESTO, C2 is C + A, C2 =< 3, C2 \== C.
accion([A, B, C], [A, B2, 3]):- RESTO is (3 - C), B > RESTO, B2 is B - RESTO, B2 =< 5, B2 \==
B.
% DE JARRA CHICA A GRANDE %
accion([A, B, C], [A2, B, 0]):- RESTO is (8 - A), C =< RESTO, A2 is A + C, A2 =< 8, A2 \== A.
accion([A, B, C], [8, B, C2]):- RESTO is (8 - A), C > RESTO, C2 is C - RESTO, C2 =< 3, C2 \==
C.
% DE JARRA CHICA A MEDIANA %
accion([A, B, C], [A, B2, 0]):- RESTO is (5 - B), C =< RESTO, B2 is B + C, B2 =< 8, B2 \== B.
accion([A, B, C], [A, 5, C2]):- RESTO is (5 - B), C > RESTO, C2 is C - RESTO, C2 =< 3, C2 \==
C.
% LA META DEL ALGORITMO ES OBTENER QUE LA PRIMERA JARRA CONTENGA 4
% LITROS, SIN IMPORTAR EL CONTENIDO DE LAS DOS RESTANTES %.
profundidad(INICIAL):- profundidad(INICIAL, [4, _, _], [INICIAL]).
profundidad([4, _, _], _ , CAMINO):- write(CAMINO).
% EL ALGORITMO DE B�SQUEDA EN PROFUNDIDAD UNIFICA DEL ESTADO ACTUAL
%A UN SUCESOR, VERIFICANDO QUE EL SUCESOR NO SE ENCUENTRE EN EL CAMINO
%ACTUAL, UNI�NDOLO PARA ENCONTRAR LA SOLUCI�N SOLICITADA. %
profundidad(ESTADO, META, CAMINO):- accion(ESTADO, SUCESOR),
 not(member(SUCESOR, CAMINO)),
 append(CAMINO, [SUCESOR], CAMINO_NUEVO),
 profundidad(SUCESOR, META, CAMINO_NUEVO).
