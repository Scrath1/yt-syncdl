FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron curl

# Install yt-dlp
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
RUN chmod a+rx /usr/local/bin/yt-dlp

# playlist ID environment variable
ENV YT_PLID=**None**

RUN echo "Received playlist id:"
RUN echo ${YT_PLID}

# Create Youtube Download directory
RUN mkdir /download

# RUN YT_PLAYLIST_ID=${YT_PLID}

# Copy hello-cron file to the cron.d directory
COPY yt-dlp-cron /etc/cron.d/yt-dlp-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/yt-dlp-cron

# Apply cron job
RUN crontab /etc/cron.d/yt-dlp-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
