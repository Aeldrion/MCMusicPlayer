#> music:playback/get_pitch_aux
#
# Auxiliary function for music:playback/get_pitch
# Gets the exact pitch (for use in playsound) corresponding to a number of note block uses
#
# @input
#   uses: int
#       The number of interactions with a note block needed to reach the desired pitch
#       A number between 0 and 24

$data modify storage music:args pitch set from storage music:data Pitches[$(uses)]
