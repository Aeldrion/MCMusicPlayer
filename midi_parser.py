import mido
import sys

NEUTRAL = 0
FLAT = 1
SHARP = 2
NOT_SUPPORTED = 3

noteToBlockHeightMapping = {0: 0, 2:1, 4: 2, 5: 3, 7: 4, 9: 5, 10: 6}
transpose = 6

def noteToBlockHeight(note: int) -> (int, int):
    note -= 55
    note += transpose
    if note >= 36:
        note -= 12
    if note < -12 or note >= 36:
        return (NOT_SUPPORTED, 0)
    
    octave = note//12
    note %= 12
    if note == 3 or note == 8:
        status = FLAT
        note += 1
    elif note in [1, 6, 11]:
        status = SHARP
        note -= 1
    else:
        status = NEUTRAL
    return (status, 7*octave + noteToBlockHeightMapping[note])
                                                                                      

def getTempo(midi: mido.MidiFile):
    for track in midi.tracks:
        for message in track:
            if message.type == "set_tempo":
                return message.tempo

def getTrackNotes(track: mido.MidiTrack):
    time = 0
    notes = []

    for message in track:
        time += message.time
        if message.type == "note_on" and message.velocity > 0:
            notes.append((time, message.note, message.channel))
        
    return notes

if __name__ == "__main__":
    assert len(sys.argv) == 2
    filename = sys.argv[1]

    midiFile = mido.MidiFile(filename)
    notes = [getTrackNotes(track) for track in midiFile.tracks]
    ticks_per_beat = midiFile.ticks_per_beat
    gameticks_per_quarternote = getTempo(midiFile) * 50

    commands = []
    failed, total = 0, 0

    for track in notes:
        for (time, pitch, channel) in track:
            total += 1

            (status, y) = noteToBlockHeight(pitch)
            if status == NOT_SUPPORTED:
                failed += 1
                continue

            x = 2*channel
            z = time*8 //ticks_per_beat
            commands.append(f"setblock ~{-x} ~{y} ~{z} minecraft:lime_concrete")
            if status == FLAT:
                commands.append(f"setblock ~{-x-1} ~{y} ~{z} minecraft:stone_button[face=wall, facing=west]")
            elif status == SHARP:
                commands.append(f"setblock ~{-x-1} ~{y} ~{z} minecraft:acacia_button[face=wall, facing=west]")
    
    with open("commands.mcfunction", mode='w') as functionFile:
        for command in commands:
            functionFile.write(command + '\n')
    
    print(f"Generated {len(commands)} commands")
    print(f"{failed} out of {total} total notes out of range")