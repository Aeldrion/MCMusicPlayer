#> music:sheet/create_bars
#
# @input
#   bars
#       The number of bars to place
#   length
#       The length (in blocks) of each bar

$function music:sheet/create_bar {length: $(length)}
$scoreboard players set bars music $(bars)
execute store result storage music:args bars int 1 run scoreboard players remove bars music 1
$execute if score bars music matches 1.. positioned ~ ~ ~$(length) run function music:sheet/create_bars with storage music:args
