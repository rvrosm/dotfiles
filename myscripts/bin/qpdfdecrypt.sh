#!/usr/local/bin/bash
#
filename="${1}"
newfile="${TMPDIR}"/"${filename}"

qpdf --decrypt "${filename}" "${newfile}" && \
mv "${newfile}" "${filename}"

pdfinfo "${filename}"
