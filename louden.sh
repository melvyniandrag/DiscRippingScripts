# $1 is the name of input file
# $2 is the name of the output file
# $3 is the integer number of decibels you want to raise the audio level

ffmpeg -i "$1" -vcodec copy -af "volume=$3dB" "$2"
