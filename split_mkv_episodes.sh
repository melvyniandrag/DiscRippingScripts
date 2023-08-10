#!/bin/bash

# Take all the .mkv in $SRC and split them into chapters 1,2 
# Save the split chapters in $DEST
# Might need to edit this script on a per-mkv basis. With my spongebob dvds, the two episodes are in chapters 1, 2
# But I dont know how the chapter indexing works - you might need chapters 7,100, or there may be more than 2 chapters
# This script worked for spongebob season 9 dvds, but may vary for other dvds.

SRC="SPONGEBOB SQUAREPANTS S9 D4"
DEST="$SRC"_SPLIT
OIFS="$IFS"
IFS=$'\n'
 
mkdir $DEST
echo "src = $SRC"
cd $SRC
for file in `find . -type f -name "*.mkv"`  
do
     filename_no_path=$(basename -- "$file")
     filename="${filename_no_path%.*}"
     echo "file = $filename"
     mkvmerge -o ../$DEST/D1_$filename.mkv --split chapters:1,2 $file
done
IFS="$OIFS"
