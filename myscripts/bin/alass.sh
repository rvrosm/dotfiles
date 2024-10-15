#/bin/env bash

for i in *.mp4; do 
    a="${i%.mp4}"; 
    for j in "${a}"*.srt; do 
	tmpname="${j%.srt}".synced.srt
	alass-cli "${i}" "${j}" "${tmpname}"; 
	mv "${tmpname}" "${j}"
    done; 
done
