tag @a remove music.listener
tag @p add music.listener
teleport @p ~-8 ~6 ~ facing ~-16 ~6 ~

kill @e[type=minecraft:marker, tag=music.reader]
scoreboard players set height music 0
execute positioned ~ ~-6 ~ summon minecraft:marker run function music:playback/summon_marker

function music:playback/loop
