from winsound import *
from time import sleep
import random
import sys, string, os
import subprocess

file_path = "./music.txt"
chords_file_path = "./chords.txt"
chords_music_file_path = "./chords_music.lp"
pause_mode = True

frequencies = {
    "A": int(440),
    "B": int(494),
    "C": int(523),
    "D": int(587),
    "E": int(659),
    "F": int(698),
    "G": int(784 / 2),
    "PAUSE": int(37),
}

notes = []
chords = []
chords_facts = ""

answer = input("Enter a number(chords): ")
if answer == "":
    answer = str(random.randint(0, 1999))
    print(f"Randomly picked: {answer}")

with open(chords_file_path) as file:
    chords_line = file.readline()
    while not chords_line.startswith("Answer: " + answer):
        chords_line = file.readline()
    chords_line = file.readline()

facts = chords_line.split()
for fact in facts:
    chords_facts += fact + ", "
    chords.append(fact[10:])

chords_facts = chords_facts[:-2] + '.'

with open(chords_music_file_path, 'w') as file:
    file.write(chords_facts)

answer = input("Enter a number (notes): ")
if answer == "":
    answer = str(random.randint(0, 1999))
    print(f"Randomly picked: {answer}")

# Reading Notes
with open(file_path) as file:
    line = file.readline()
    while not line.startswith("Answer: " + answer):
        line = file.readline()
    line = file.readline()

facts = line.split()
for fact in facts:
    if fact[5] == 'n':
        notes.append(fact[9:])

notes = sorted(notes, key=lambda x: int(x[1:].split(",")[0]))
chords = sorted(chords, key=lambda x: int(x[1:].split(",")[0]))
print()

""" Printing song's chord progression """
for chord_item in chords:
    chord = chord_item.replace("(", "").replace(")", "").split(",")
    if int(chord[0]) % 4 == 0:
        print(chord[1].capitalize(), end=", ", flush=True)
print("\b\b.")

# print(notes)

measure = 0
print()

if pause_mode:
    PlaySound("Drumbeat.wav", SND_ASYNC)

while True:
    for song_item in notes:

        beat = song_item.replace("(", "").replace(")", "").split(",")
        note = frequencies[beat[2].upper()]
        time = int(beat[1])
        print(beat[2].upper() + "(" + str(time) + ")", end=", ", flush=True)
        Beep(note, time * 300)
        measure = measure + time

        if int(beat[0]) % 2 == 0:
            PlaySound("res/Kick.wav", SND_ASYNC)
        if int(beat[0]) % 4 == 0:
            if pause_mode:
                remaining_measure = 8 - measure
                if remaining_measure == 3:
                    sleep(0.3)
                    PlaySound("res/Kick.wav", SND_ASYNC)
                    remaining_measure -= 1
                sleep(remaining_measure * 0.3)
                PlaySound("res/Drumbeat.wav", SND_ASYNC)
            measure = 0
    print("\n")
print("\b\b.")
