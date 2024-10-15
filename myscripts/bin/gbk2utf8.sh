#!/bin/bash

filename="${1}"

iconv -f gbk -t utf8 "${filename}" > "${filename}".utf8

mv "${filename}" "${filename}".gbk

mv "${filename}".utf8 "${filename}"
