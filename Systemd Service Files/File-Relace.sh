#!/usr/bin/env bash

# Replace with Appropriate Names
FOLDER_1="./test1"
FOLDER_2="./test2"

echo "Folder 1: "$FOLDER_1
echo "Folder 2: "$FOLDER_2
if [ $FOLDER_1 -nt $FOLDER_2 ]
then
        echo "$FOLDER_1 is newer than $FOLDER_2."
        mv $FOLDER_2 $FOLDER_2.bak && cp -r $FOLDER_1 $FOLDER_2
        echo "$FOLDER_2 has been replaced with updated files and backed up to $FOLDER_2.bak"
else
        echo "$FOLDER_2 is newer than $FOLDER_1."
        echo "Nothing to do."
fi