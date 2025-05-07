#> music:playback/play_note
#
# Plays a single note at the listener's position
#
# @input
#   sound: any sound event
#   suffix: a suffix for the sound event (expected to be either '', '_high' or '_low')
#   pitch: the pitch of the sound, between 0.5 and 2.0
#   volume: the volume of the sound, between 0.0 and 1.0

particle minecraft:note ~-1 ~ ~ 0 0 0 1 1 force @a[tag=music.listener]
$execute as @a[tag=music.listener] at @s run playsound $(sound)$(suffix) record @s ~ ~ ~ $(volume) $(pitch)
