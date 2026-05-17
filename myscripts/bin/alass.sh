#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

process_video() {
    video="$1"

    base="${video%.mp4}"

    echo "Processing: $video"

    for subtitle in "${base}"*.srt; do
        [[ -e "$subtitle" ]] || continue
        temp_file="${subtitle%.srt}.synced.srt"

        echo "  Syncing: $subtitle"
        alass-cli "$video" "$subtitle" "$temp_file" && mv "$temp_file" "$subtitle"
    done
}

export -f process_video

parallel -j4 process_video ::: *.mp4
