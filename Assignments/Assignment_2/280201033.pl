grid(WordLengths, Intersections, Returned):-
    length(WordLengths, TotalLength),
    actualGrid(WordLengths, Intersections, Returned ,TotalLength).

actualGrid([], _, [], _).

actualGrid([Elem|WordLengths], Intersections, [X|Returned], TotalLength):-
    word(X),
    atom_length(X,Elem),
    actualGrid(WordLengths, Intersections, Returned, TotalLength),
    \+memberchk(X, Returned),
    checkIntersections(X, Intersections, Returned, TotalLength).

checkIntersections(_, [], _, _).

checkIntersections(X, [I|Is], Returned, TotalLength):-
    checkIntersection(X, I, Returned, TotalLength),
    checkIntersections(X, Is, Returned, TotalLength).

% These intersection checkers are written assuming that every
% intersection's first index is smaller than the 3th index.

checkIntersection(_,I,Returned, TotalLength):-
    length(Returned, RN),
    Xi is TotalLength-RN-1,
    \+nth0(0,I,Xi).%If the intersection's first index is not equal to xi, no need
                   %to check the intersection. If it is in the 3th index, it will
                   %be later checked by the next appended element.
checkIntersection(X, I, Returned, TotalLength):-
    length(Returned, RN),
    Xi is TotalLength-RN-1,
    nth0(0,I,Xi), %Only checking the intersections with lowest words index being
    nth0(1,I,Xletterindex),  %equal to xi since returned list will have words only
    nth0(2,I,Ii),            %have words after xi.
    nth0(3,I,Iletterindex),
    Ri is Ii+RN-TotalLength,
    nth0(Ri,Returned,Iword),
    sub_string(X,Xletterindex,1,_,Xletter),
    sub_string(Iword, Iletterindex, 1,_,Iletter),
    Iletter = Xletter.
