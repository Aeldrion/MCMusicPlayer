tag @s add music.reader
scoreboard players operation @s music.height = height music
scoreboard players add height music 1
execute if score height music matches ..34 positioned ~ ~1 ~ summon minecraft:marker run function music:playback/summon_marker
