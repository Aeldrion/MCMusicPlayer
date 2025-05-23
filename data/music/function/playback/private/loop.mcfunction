#> music:playback/private/loop
#
# Runs one step (one tile) of the playback loop, and re-schedules itself after 2 ticks
#
# @private
# @within music:playback/play
# @within music:playback/resume
# @within music:playback/private/loop

# Execute any command blocks on the back of the sheet
execute if block ~1 ~ ~ minecraft:command_block run data modify block ~1 ~ ~ auto set value true
execute if block ~1 ~ ~-1 minecraft:command_block run data modify block ~1 ~ ~-1 auto set value false

# Get readers to read notes on all channels
execute as @a[tag=music.listener] at @s run teleport @s ~ ~ ~1
execute as @e[type=minecraft:marker, tag=music.reader] at @s run function music:playback/private/read_channels

# Read lyrics and teleport the playback display forward
execute at @e[type=minecraft:item_display, tag=music.bar] at @s positioned ~ ~1 ~ run function music:playback/private/read_lyrics
execute as @e[type=minecraft:item_display, tag=music.bar] at @s run teleport @s ~ ~ ~1

# Loop again
schedule function music:playback/private/loop 2t
