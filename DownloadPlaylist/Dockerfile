FROM ubuntu:22.04

RUN apt-get update && apt-get -y install cron curl python3 ffmpeg

# Install yt-dlp
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
RUN chmod a+rx /usr/local/bin/yt-dlp

# playlist ID environment variable
ENV DL="dQw4w9WgXcQ"

# Create Youtube Download directory
RUN mkdir /download

# RUN YT_PLAYLIST_ID=${YT_PLID}

# Copy yt-dlp-cron file to the cron.d directory
COPY yt-dlp-cron /etc/cron.d/yt-dlp-cron

# Copy start.sh script to the basedir
COPY start.sh .

# Copy yt-dlp.sh script to the basedir
COPY yt-dlp.sh .
RUN chmod +x /yt-dlp.sh

# Allow to execute the script
RUN chmod +x /start.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD ./start.sh