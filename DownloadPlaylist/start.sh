#!/bin/bash

# Add environment variable to cron job
cd /etc/cron.d && echo DL=${DL} > new-cron && cat yt-dlp-cron >> new-cron && mv new-cron yt-dlp-cron

# Give execution rights on the cron job
chmod 0644 /etc/cron.d/yt-dlp-cron

# Apply cron job
crontab /etc/cron.d/yt-dlp-cron

# Run cron job
cron -f -l 2 && tail -f /var/log/cron.log