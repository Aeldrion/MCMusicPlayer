#> music:playback/start
#
# Initializes and starts a playback session on the music sheet at the current position
#
# @public

# Set up and teleport player
tag @a remove music.listener
tag @p add music.listener
teleport @p ~-8 ~6 ~ facing ~-16 ~6 ~

# Reset and summon note readers at every line on the staff
kill @e[type=minecraft:marker, tag=music.reader]
scoreboard players set height music 0
execute positioned ~ ~-6 ~ summon minecraft:marker run function music:playback/private/summon_marker

# Start the schedule loop
function music:playback/private/loop
