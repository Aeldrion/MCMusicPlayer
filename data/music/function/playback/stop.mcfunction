#> music:playback/stop
#
# Stops playback, resets entities and teleports the player at the beginning of the music sheet
#
# @public

function music:playback/pause
kill @e[type=minecraft:marker, tag=music.reader]
teleport @s ~ ~ 0
