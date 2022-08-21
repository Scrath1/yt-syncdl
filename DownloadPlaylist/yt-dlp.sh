#!/bin/bash
IFS=','
for id in ${DL}; do
    IFS=';' array=($id)
    echo "==========================================================================="
    echo "ID: ${array[0]}"
    echo "Folder: ${array[1]}"
    echo "yt-dlp options:" ${array[2]}
    echo "Executed command: /usr/local/bin/yt-dlp ${array[2]} --output \"/download/${array[1]}/%(title)s.%(ext)s\" --download-archive /download/archive.txt -i ${array[0]}"
    /usr/local/bin/yt-dlp ${array[2]} --output "/download/${array[1]}/%(title)s.%(ext)s" --download-archive /download/archive.txt -i ${array[0]}
done