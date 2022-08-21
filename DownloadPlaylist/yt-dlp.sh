#!/bin/bash

originalIFS=$IFS
IFS=','

for paramString in ${DL}; do
    echo --------------------------------------
    id=$(echo "$paramString" | awk -F';' '{print $1}')
    outputDir=$(echo "$paramString" | awk -F';' '{print $2}')
    args=$(echo "$paramString" | awk -F';' '{print $3}')

    echo "ID: $id"
    echo "outputDir: $outputDir"
    echo "opt. Arguments: $args"
    echo "/usr/local/bin/yt-dlp ${args} --output \"/download/${outputDir}/%(title)s.%(ext)s\" --download-archive /download/archive.txt -i ${id}" | /bin/bash
    chmod -R 777 /download/${outputDir}
    echo --------------------------------------
done

tail -n ${MAX_LOG_LINES} /var/log/cron.log > /var/log/tmp.log
rm /var/log/cron.log && mv /var/log/tmp.log /var/log/cron.log

IFS=$originalIFS