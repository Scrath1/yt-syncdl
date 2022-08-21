build:
				docker rmi download-playlist ; true
				cd DownloadPlaylist && docker build -t download-playlist .
start:
				docker-compose up
stop:
				docker-compose down