#!/usr/local/bin/bash


outputdir=~/Downloads/img2anki/out/
backupdir=~/Downloads/img2anki/backup/


cd ~/Downloads/img2anki/download

for file in *; do
	if [ -f "${file}" ]; then
		magick "${file}" -resize x300 ${outputdir}/"${file}"
		mv -- "$file" "${backupdir}"
		echo "move ${file} to ${backupdir}"
	fi
done


