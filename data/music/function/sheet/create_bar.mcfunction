#> music:sheet/create_bar
#
# Creates one bar of a music sheet
#
# @input
#   length
#       The length (in blocks) of the bar

fill ~ ~ ~1 ~ ~19 ~1 minecraft:black_concrete

$fill ~ ~ ~2 ~ ~ ~$(length) minecraft:black_concrete
$fill ~ ~1 ~2 ~ ~5 ~$(length) minecraft:barrier

$fill ~ ~6 ~2 ~ ~6 ~$(length) minecraft:black_concrete
$fill ~ ~7 ~2 ~ ~7 ~$(length) minecraft:barrier
$fill ~ ~8 ~2 ~ ~8 ~$(length) minecraft:black_concrete
$fill ~ ~9 ~2 ~ ~9 ~$(length) minecraft:barrier
$fill ~ ~10 ~2 ~ ~10 ~$(length) minecraft:black_concrete
$fill ~ ~11 ~2 ~ ~11 ~$(length) minecraft:barrier
$fill ~ ~12 ~2 ~ ~12 ~$(length) minecraft:black_concrete
$fill ~ ~13 ~2 ~ ~13 ~$(length) minecraft:barrier
$fill ~ ~14 ~2 ~ ~14 ~$(length) minecraft:black_concrete

$fill ~ ~15 ~2 ~ ~18 ~$(length) minecraft:barrier
$fill ~ ~19 ~2 ~ ~19 ~$(length) minecraft:black_concrete