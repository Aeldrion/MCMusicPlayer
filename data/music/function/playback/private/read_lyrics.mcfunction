#> music:playback/private/read_lyrics
#
# Looks for a sign behind the music sheet, and if there is one, displays its text in the listener's actionbar
#
# @context The block behind the bottom of the staff (low E on a treble clef), where the sign should be placed

execute if block ~ ~ ~ #minecraft:wall_signs run title @p[tag=music.listener] title ""
execute if block ~ ~ ~ #minecraft:wall_signs run title @p[tag=music.listener] actionbar [\
    {text: "", color: "gold"},\
    {text: "🎵 ", bold: true, color: "green"},\
    {nbt: "front_text.messages[0]", block: "~ ~ ~", interpret: true},\
    {nbt: "front_text.messages[1]", block: "~ ~ ~", interpret: true},\
    {nbt: "front_text.messages[2]", block: "~ ~ ~", interpret: true},\
    {nbt: "front_text.messages[3]", block: "~ ~ ~", interpret: true}\
]
