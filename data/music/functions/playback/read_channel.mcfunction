scoreboard players add channel music 1
function music:playback/read_note
execute if score channel music < channels music positioned ~-2 ~ ~ run function music:playback/read_channel
