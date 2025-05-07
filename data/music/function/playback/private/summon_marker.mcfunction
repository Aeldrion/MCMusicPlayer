#> music:playback/summon_marker
#
# Sets up data for a note reader marker, and summons a new one until all lines on the staff are covered
#
# @private
# @context @s: a newly summoned marker
# @within music:playback/start
# @within music:playback/summon_marker

tag @s add music.reader
tag @s add music.teleport_along
scoreboard players operation @s music.height = height music
scoreboard players add height music 1
execute if score height music matches ..34 positioned ~ ~1 ~ summon minecraft:marker run function music:playback/private/summon_marker
