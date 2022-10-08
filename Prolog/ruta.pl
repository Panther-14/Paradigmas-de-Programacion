ruta_directa(xalapa,coatepec).
ruta_directa(coatepec, allende).
ruta_directa(allende, xico).
ruta_directa(banderilla, xalapa).
ruta_directa(perote, vigas).
ruta_directa(vigas, cruz_blanca).
ruta_directa(puebla,perote).

% Escribe un conjunto de reglas del predicado ruta /2 que escriba true si
% existe una ruta del primer argumento al segundo o false en caso
% contrario, siguiendo la siguiente estructura del predicado main.

ruta(X,Y):-ruta_directa(X,Y).

main():- read(X), read(Y), ruta(X, Y), write("true").
main():- write("false").
