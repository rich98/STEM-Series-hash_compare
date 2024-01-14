#!/bin/bash

# ********************************
# *****  HASH MATCH CHECKER  *****
# ***** By Rich98            *****
# ********************************

# Get the hash and set the variable for file1
PathFile1="<add path and filename>"
HashFile1=$(sha256sum "$PathFile1" | awk '{print $1}')

# Get the hash and set the variable for file2
PathFile2="<add path and filename>"
HashFile2=$(sha256sum "$PathFile2" | awk '{print $1}')

# Compare the hashes
if [[ -n "$HashFile1" && -n "$HashFile2" ]]; then
    if [ "$HashFile1" == "$HashFile2" ]; then
        echo "INFO:  Hashes match."
    else
        echo "ERROR: Hashes differ!"
    fi
else
    echo "ERROR: One or both hashes are missing!"
fi

echo "$HashFile1"
echo "$HashFile2"
read -p "Press Enter to continue..."
