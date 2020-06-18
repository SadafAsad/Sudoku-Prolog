:- use_module(library(clpfd)).

start:-
    Puzzle = [[2,_,_,_,9,_,_,3,_],
              [_,5,_,1,_,_,_,_,_],
              [9,_,_,_,_,_,6,_,_],
              [_,_,_,_,5,_,_,_,_],
              [_,_,_,7,_,_,_,_,8],
              [_,1,_,_,_,_,_,_,_],
              [6,_,_,_,_,_,2,_,_],
              [_,_,_,_,4,_,_,_,_],
              [_,4,_,_,_,_,7,_,9]],
    format('###### Sudoku Puzzle ######~n'),
    sudoku(Puzzle),
    maplist(label,Puzzle),
    maplist(portray_clause,Puzzle).

sudoku(Rows):-
    length(Rows, 9),
    maplist(same_length(Rows), Rows),
    append(Rows, Vs),
    Vs ins 1..9,

    maplist(all_distinct, Rows),

    transpose(Rows, Columns),
    maplist(all_distinct, Columns),

    Rows = [R1,R2,R3,R4,R5,R6,R7,R8,R9],
    squares(R1,R2,R3),
    squares(R4,R5,R6),
    squares(R7,R8,R9).

squares([],[],[]).
squares([X1,X2,X3|S1],
        [X4,X5,X6|S2],
        [X7,X8,X9|S3]):-
    all_distinct([X1,X2,X3,X4,X5,X6,X7,X8,X9]),
    squares(S1,S2,S3).
