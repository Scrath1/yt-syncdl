#!/bin/bash

# Add environment variable to cron job
cd /etc/cron.d && echo -e "DL=${DL}\nMAX_LOG_LINES=${MAX_LOG_LINES}" > new-cron && cat yt-dlp-cron >> new-cron && mv new-cron yt-dlp-cron

# replace CRON_TIMING with actual values
sed -i "s/CRON_TIMING/${CRON//\"}/" /etc/cron.d/yt-dlp-cron

# Give execution rights on the cron job
chmod 0644 /etc/cron.d/yt-dlp-cron

# Apply cron job
crontab /etc/cron.d/yt-dlp-cron

# Run cron job
cron -l 2 && tail -f /var/log/cron.log