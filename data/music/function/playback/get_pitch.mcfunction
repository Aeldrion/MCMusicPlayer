# Switch to a playable range
scoreboard players operation height music = @s music.height
scoreboard players remove height music 7
data modify storage music:args suffix set value ""
execute if score height music matches 14.. run data modify storage music:args suffix set value "_high"
execute if score height music matches 14.. run scoreboard players remove height music 7
execute if score height music matches ..-1 run data modify storage music:args suffix set value "_low"
execute if score height music matches ..-1 run scoreboard players add height music 7

# Count 2 semitones for every line, then remove 1 for every line worth one single semitone
scoreboard players operation pitch music = height music
scoreboard players operation pitch music += pitch music
scoreboard players add pitch music 1
execute if score pitch music matches 7.. run scoreboard players remove pitch music 1
execute if score pitch music matches 12.. run scoreboard players remove pitch music 1
execute if score pitch music matches 19.. run scoreboard players remove pitch music 1
execute if score pitch music matches 24.. run scoreboard players remove pitch music 1

# Take into account flats/sharps
execute if block ~-1 ~ ~ #music:flat run scoreboard players remove pitch music 1
execute if block ~-1 ~ ~ #music:sharp run scoreboard players add pitch music 1

# Get pitch from storage list
execute if score pitch music matches 25.. run scoreboard players set pitch music 24
execute store result storage music:args uses int 1 run scoreboard players get pitch music
function music:playback/get_pitch_aux with storage music:args
