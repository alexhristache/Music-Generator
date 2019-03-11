Requirements:
- clingo 5.3.0
- python 3.7.2

Steps:
1. clingo chords.lp 2000 > chords.txt
2. python MusicIAI.py
3. Input a number (for chord generation) [0..2000]
 3.1 [IMPORTANT!] Don't input another number yet
4. In another terminal -> clingo chords_music.lp notes.lp 2000 > music.txt
5. In python terminal -> Input a number (for notes generation) [0.2000]