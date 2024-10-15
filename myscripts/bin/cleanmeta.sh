#!/bin/bash

if [[ -f "${1}" ]]; then

exiftool -all= "${1}"
touch  -r -d "Sep 1 1927 23:58:59" "${1}"
stat "${1}"

fi
