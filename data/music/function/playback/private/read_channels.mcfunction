#> music:playback/private/read_channels
#
# Scans all channels for notes, and progresses to the next block
#
# @private
# @within music:playback/private/loop
# @context @s: any music reader

scoreboard players set channel music 0
function music:playback/private/read_channel
teleport @s ~ ~ ~1
