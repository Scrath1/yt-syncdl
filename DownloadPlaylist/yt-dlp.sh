#!/bin/bash

IFS=','
for id in ${DL}; do
    IFS=';' array=($id)
    echo "==========================================================================="
    echo "ID: ${array[0]}"
    echo "Folder: ${array[1]}"
    echo "yt-dlp options:" ${array[2]}
    # Workaround since the yt-dlp options cause some kind of formatting issue if used directly
    echo "/usr/local/bin/yt-dlp ${array[2]} --output \"/download/${array[1]}/%(title)s.%(ext)s\" --download-archive /download/archive.txt -i ${array[0]}" | /bin/bash
    
    # Shorten the log if it gets too large
    echo "Max log lines: ${MAX_LOG_LINES}"
    tail -n ${MAX_LOG_LINES} /var/log/cron.log > /var/log/tmp.log
    rm /var/log/cron.log
    mv /var/log/tmp.log /var/log/cron.log
    # /usr/local/bin/yt-dlp ${array[2]} --output "/download/${array[1]}/%(title)s.%(ext)s" --download-archive /download/archive.txt -i ${array[0]}
    chmod -R 777 /download/${array[1]}
done