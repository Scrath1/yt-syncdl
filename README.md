# docker-yt-playlist-syncdl
Docker container that periodically runs a cron job to download missing files from a youtube playlist. Can theoretically also work with videos but why would you do that?

## Environment variables:

| Variable | Description                                        | Example                                                                                   |
|----------|----------------------------------------------------|-------------------------------------------------------------------------------------------|
| DL       | Comma separated list of yt-dlp targets and options | \<Youtube ID\>;\<Target folder name\>;\<yt-dlp options\>,\<Youtube ID\>;\<Target folder name\>(...) |

At least the Youtube ID should be set. All other options are optional.

For a list of yt-dlp options see [here](https://github.com/yt-dlp/yt-dlp#usage-and-options). The `--download-archive` option is always used. If you want to turn this off, you will have to clone this repo and remove it yourself from the file `yt-dlp.sh`.

## Volumes:

| Name     | Description                                            | Container Path |
|----------|--------------------------------------------------------|----------------|
| Download | Folder containing the yt-dlp archive and all downloads | /download      |
| Log      | Folder containing the cron.log                         | /var/log       |