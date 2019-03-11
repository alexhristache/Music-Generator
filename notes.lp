note(c;d;e;f;g;a;b).
time(1;2).

lim(32).
beat(1..L) :- lim(L).

1 { play_note(B,T,N) : note(N), time(T) } 1 :- beat(B).

% Don't allow more than one repetition %
:- play_note(B,_,N), play_note(B+1,_,N), play_note(B+2,_,N).

% No 1-2-1 time beats %
:- play_note(B,1,N), play_note(B+1,2,N2), play_note(B+2,1,N3).

% No 2-1-2 time beats %
:- play_note(B,2,N), play_note(B+1,1,N2), play_note(B+2,2,N3).

% No 5 consecutive 1-time beats.
:- play_note(B,1,N1), play_note(B+1,1,N2), play_note(B+2,1,N3), play_note(B+3,1,N4), play_note(B+4,1,N5).

%:- play_note(B,_,N1), play_note(B+1,_,N2), play_note(B,_,N1), play_note(B+1,_,N2).

% No 4 consecutive 2-time beats
:- play_note(B,2,N1), play_note(B+1,2,N2), play_note(B+2,2,N3), play_note(B+3,2,N4).

% No 1-2 starting beats.
:- play_note(1,1,_), play_note(2,2,_).

% No 2-1 ending beat.
:- play_note(L-1,2,N), play_note(L,1,N), lim(L).

% No 2 pairs of notes repeating
:- play_note(B,_,N1), play_note(B+1,_,N2), play_note(B+2,_,N1), play_note(B+3,_,N2).

% Song should end in C or A
%:- play_note(L,_,b;L,_,d;L,_,e;L,_,f;L,_,g), lim(L).

% Follow the chords.
:- play_chord(B,amin), play_note(B,_,b). % A C E
:- play_chord(B,amin), play_note(B,_,d). % A C E
:- play_chord(B,amin), play_note(B,_,f). % A C E
:- play_chord(B,amin), play_note(B,_,g). % A C E

:- play_chord(B,cmaj), play_note(B,_,a). % C E G
:- play_chord(B,cmaj), play_note(B,_,b). % C E G
:- play_chord(B,cmaj), play_note(B,_,d). % C E G
:- play_chord(B,cmaj), play_note(B,_,f). % C E G

:- play_chord(B,dmin), play_note(B,_,c). % D F A
:- play_chord(B,dmin), play_note(B,_,e). % D F A
:- play_chord(B,dmin), play_note(B,_,g). % D F A
:- play_chord(B,dmin), play_note(B,_,b). % D F A

:- play_chord(B,emin), play_note(B,_,c). % E G B
:- play_chord(B,emin), play_note(B,_,d). % E G B
:- play_chord(B,emin), play_note(B,_,f). % E G B
:- play_chord(B,emin), play_note(B,_,a). % E G B

:- play_chord(B,fmaj), play_note(B,_,d). % F A C
:- play_chord(B,fmaj), play_note(B,_,e). % F A C
:- play_chord(B,fmaj), play_note(B,_,g). % F A C
:- play_chord(B,fmaj), play_note(B,_,b). % F A C

:- play_chord(B,gmaj), play_note(B,_,c). % G B D
:- play_chord(B,gmaj), play_note(B,_,e). % G B D
:- play_chord(B,gmaj), play_note(B,_,f). % G B D
:- play_chord(B,gmaj), play_note(B,_,a). % G B D

#show play_note/3.