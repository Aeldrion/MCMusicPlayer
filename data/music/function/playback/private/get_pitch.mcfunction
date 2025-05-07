#> music:playback/private/get_pitch
#
# Gets the pitch (for use in playsound) of the current note, taking into account accidentals
# Potentially adds a suffix to the sound event (e.g. minecraft:block.note_block.harp -> e.g. minecraft:block.note_block.harp_high) if the pitch is not within the allowed range for playsound
#
# @private
# @within music:playback/private/read_note
# @writes
#   storage music:args suffix: str
#       Suffix to add to the sound event
#       One of "_low", "_high" or ""
#   storage music:args pitch: float
#       The pitch to use in the playsound command
#       A number between 0.5 and 2.0

# Switch to a playable range
scoreboard players operation height music = @s music.height
scoreboard players remove height music 7
data modify storage music:args suffix set value ""
execute if score height music matches 14.. run data modify storage music:args suffix set value "_high"
execute if score height music matches 14.. run scoreboard players remove height music 7
execute if score height music matches ..-1 run data modify storage music:args suffix set value "_low"
execute if score height music matches ..-1 run scoreboard players add height music 7

# Count note block uses: 2 semitones for every line on the staff, minus 1 for every natural semitone
scoreboard players operation pitch music = height music
scoreboard players operation pitch music += pitch music
scoreboard players add pitch music 1
execute if score pitch music matches 7.. run scoreboard players remove pitch music 1
execute if score pitch music matches 12.. run scoreboard players remove pitch music 1
execute if score pitch music matches 19.. run scoreboard players remove pitch music 1
execute if score pitch music matches 24.. run scoreboard players remove pitch music 1

# Add or remove one note block use if there is a flat or sharp
execute if block ~-1 ~ ~ #music:flat run scoreboard players remove pitch music 1
execute if block ~-1 ~ ~ #music:sharp run scoreboard players add pitch music 1

# Translate number of note block uses to pitch
execute if score pitch music matches 25.. run scoreboard players set pitch music 24
execute store result storage music:args uses int 1 run scoreboard players get pitch music
function music:playback/private/get_pitch_aux with storage music:args
