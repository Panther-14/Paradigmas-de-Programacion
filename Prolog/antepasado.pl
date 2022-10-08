padre(juan, jesus).
madre(maria, jesus).
padre(stan, juan).
madre(lore, juan).
padre(dios, stan).
madre(espiritu, stan).
padre(devil, lore).
madre(luz, lore).

antepasado(X, Y):-
padre(X, Y).
antepasado(X, Y):-
madre(X, Y).
antepasado(X, Y):-
padre(X, W),
antepasado(W, Y).
antepasado(X, Y):-
madre(X, W),
antepasado(W, Y).

main():-
read(X),
read(Y),
antepasado(X, Y),
write("true").
main():-
write("false").
