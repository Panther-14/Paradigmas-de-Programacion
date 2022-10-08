voltear2([], []).
voltear2([H | T], R):-
voltear2(T, R2),
append(R2, [H], R).

%#1 L = [1,2], H= 1, T=[2], R2= [2], R=[2,1]
%#2 L = [2], H= 2, T= [], R2 = [], R=[2]
%#3 L = [], R = []

voltear(L, R):-
voltear(L, [], R).
voltear([], Ac, Ac).
voltear([H | T], Ac, R):-
voltear(T, [H | Ac], R).
 
main():-
read(L),
voltear(L, R),
write(R).