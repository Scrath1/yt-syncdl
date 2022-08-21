#!/bin/bash
IFS=','
for id in ${DL}; do
    IFS=';' array=($id)
    echo "==========================================================================="
    echo "ID: ${array[0]}" >> /var/log/cron.log
    echo "Folder: ${array[1]}" >> /var/log/cron.log
    echo "yt-dlp options:" ${array[2]} >> /var/log/cron.log
    /usr/local/bin/yt-dlp ${array[2]} --output "/download/${array[1]}/%(title)s.%(ext)s" --download-archive /download/archive.txt -i ${array[0]} >> /var/log/cron.log
done