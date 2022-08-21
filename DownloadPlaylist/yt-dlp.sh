#!/bin/bash

/usr/local/bin/yt-dlp --ignore-errors --format bestaudio --extract-audio --output "/download/%(title)s.%(ext)s" --download-archive ./archive.txt -i ${YT_PLID} >> /var/log/cron.log