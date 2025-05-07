#define storage music:args
#define storage music:data

data modify storage music:data Pitches set value [0.500000, 0.529732, 0.561231, 0.594604, 0.629961, 0.667420, 0.707107, 0.749154, 0.793701, 0.840896, 0.890899, 0.943874, 1.000000, 1.059463, 1.122462, 1.189207, 1.259921, 1.334840, 1.414214, 1.498307, 1.587401, 1.681793, 1.781797, 1.887749, 2.000000]
scoreboard objectives add music dummy
scoreboard objectives add music.height dummy

scoreboard players set channels music 3
