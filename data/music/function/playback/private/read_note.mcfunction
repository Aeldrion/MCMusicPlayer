#> music:playback/private/read_note
#
# Checks for a block at the current position, and plays the corresponding note if there is one
#
# @private
# @within music:playback/private/read_channel

# Stop if there is no block
execute if block ~ ~ ~ minecraft:air run return fail

# Make an item plop effect in the listener's hotbar
item replace entity @a[tag=music.listener] hotbar.4 with air
loot replace entity @a[tag=music.listener] hotbar.4 mine ~ ~ ~

# Get information about the current note
function music:playback/private/get_sound_event
function music:playback/private/get_pitch
data modify storage music:args volume set value 1

# Play the note
function music:playback/private/play_note with storage music:args
