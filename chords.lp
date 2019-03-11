chord(cmaj;dmin;emin;fmaj;gmaj;amin).
lim(32).
cbeat(1..L) :- lim(P), L = P/4.

1 { play_chord_aux(B,C) : chord(C), cbeat(B) } 1 :- cbeat(B).

:- play_chord_aux(B,C), play_chord_aux(B+1,C).
:- play_chord_aux(B,C), play_chord_aux(B+1,C2), play_chord_aux(B+2,C).

:- play_chord_aux(1,dmin; 1,emin; 1,fmaj; 1,gmaj).
:- play_chord_aux(L-3,dmin; L-3,emin), lim(L).
:- play_chord_aux(B,emin), play_chord_aux(B+1,cmaj).

play_chord(F,C) :- play_chord_aux(B,C), F = B*4 - 3.
play_chord(F,C) :- play_chord(R,C), F = B*4 - 2, R = B*4 - 3.
play_chord(F,C) :- play_chord(R,C), F = B*4 - 1, R = B*4 - 3.
play_chord(F,C) :- play_chord(R,C), F = B*4, R = B*4 - 3.

#show play_chord/2.