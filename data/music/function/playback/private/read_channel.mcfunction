#> music:playback/private/read_channel
#
# Reads any blocks at the current position
#
# @private
# @context @s: a music reader
# @within music:playback/private/read_channels
# @within music:playback/private/read_channel

# Scan for notes
scoreboard players add channel music 1
function music:playback/private/read_note

# Loops until all channels have been scanned
execute if score channel music < channels music positioned ~-2 ~ ~ run function music:playback/private/read_channel
