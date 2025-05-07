#> music:playback/get_sound_event
#
# Gets the sound event corresponding to the block at the current position
#
# @writes
#   music:args sound: str
#       The sound event to play

data remove storage music:args sound

execute if block ~ ~ ~ minecraft:lime_concrete run return run data modify storage music:args sound set value "minecraft:block.note_block.grand_piano"
execute if block ~ ~ ~ minecraft:blue_concrete run return run data modify storage music:args sound set value "minecraft:block.note_block.guitar"
execute if block ~ ~ ~ minecraft:purple_concrete run return run data modify storage music:args sound set value "minecraft:block.note_block.flute"
