execute if block ~ ~ ~ minecraft:air run return fail
item replace entity @a[tag=music.listener] hotbar.4 with air
loot replace entity @a[tag=music.listener] hotbar.4 mine ~ ~ ~

function music:playback/get_sound_event
function music:playback/get_pitch
data modify storage music:args volume set value 1

function music:playback/play_note with storage music:args
