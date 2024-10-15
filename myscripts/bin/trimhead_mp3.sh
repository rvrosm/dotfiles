#!/usr/local/bin/bash
#
FILENAME="${1}"
length="${2}"

filename_noextention="${FILENAME%.*}"

sox -V3 ${filename_noextention}{.mp3,_trim.mp3} trim $length
