#!/bin/bash
#
ffmpeg -i "${1}" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000  $(basename "${1}").mp3

