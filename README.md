# yt-syncdl
Docker container that periodically runs a cron job to download missing files from youtube playlists using yt-dlp with the archive option. Can theoretically also work with videos but why would you do that?

## Environment variables:

| Variable | Description                                        | Example                                                                                   |
|----------|----------------------------------------------------|-------------------------------------------------------------------------------------------|
| DL       | Comma separated list of yt-dlp targets and options | \<Youtube ID\>;\<Target folder name\>;\<yt-dlp options\>,\<Youtube ID\>;\<Target folder name\>(...) |
| CRON     | String that determines the cron timing. If you don't set this, the cron job will be executed every minute.| 12:00pm daily:  "0 0 12 * * ?" For more examples see [here](https://www.netiq.com/documentation/cloud-manager-2-5/ncm-reference/data/bexyssf.html) |
| MAX_LOG_LINES | Maximum number of lines allowed for the log file. Defaults to 10000 if not set. | any number |

**Note:** The docker container uses UTC time. Make sure to adjust your CRON variable accordingly.

At least the Youtube ID should be set. All other options of the DL variable are optional.

For a list of yt-dlp options see [here](https://github.com/yt-dlp/yt-dlp#usage-and-options). The `--download-archive` option is always used. If you want to turn this off, you will have to clone this repo and remove it yourself from the file `yt-dlp.sh`.

## Volumes:

| Name     | Description                                            | Container Path |
|----------|--------------------------------------------------------|----------------|
| Download | Folder containing the yt-dlp archive and all downloads | /download      |
| Log      | Folder containing the cron.log                         | /var/log       |

## Using the container
You can pull the container using
> docker pull ghcr.io/scrath1/yt-syncdl:latest

