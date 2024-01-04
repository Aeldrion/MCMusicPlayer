# Execute command blocks
execute if block ~1 ~ ~ minecraft:command_block run data modify block ~1 ~ ~ auto set value true
execute if block ~1 ~ ~-1 minecraft:command_block run data modify block ~1 ~ ~-1 auto set value false

# Get readers to read notes on all channels
execute as @a[tag=music.listener] at @s run teleport @s ~ ~ ~1
execute as @e[type=minecraft:marker, tag=music.reader] at @s run function music:playback/read_channels

# Loop again
schedule function music:playback/loop 5t
