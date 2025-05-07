place template music:treble_clef ~-1 ~-1 ~-1

data modify storage music:args length set value 16
data modify storage music:args bars set value 32
function music:sheet/create_bars with storage music:args