#!/bin/bash

# $1 - directory holding mkv files. See further comments below
# $2 - integer number of decibels to raise volume
#
# This script is useful for raising the volume of a bunch of episodes that are in the same directory.
#
# Place all mkv files in directory $1
# Use handbrake or other app to transcode to mp4 and put mp4s in $1/Transcoded
# This script will raise the volume of all mp4s in $1/Transcoded and save them to $1/Transcoded/loud
# The volume will be raised by $2 decibels.

SRC="$1/Transcoded"
DEST="loud"
OIFS="$IFS"
IFS=$'\n'
 
cd $SRC
rm -rf $DEST
mkdir $DEST

for file in `find . -type f -name "*.mp4"`  
do
     filename_no_path=$(basename -- "$file")
     echo $file
     ffmpeg -i "$file" -vcodec copy -af "volume=$2dB" "$DEST/$filename_no_path"
done
IFS="$OIFS"
