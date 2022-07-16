#video_file="data/sample_football_video.mp4"
video_file="$1"

ffmpeg -re -i $video_file -vcodec libx264 -vprofile baseline -g 30 -acodec aac -strict -2 -f flv rtmp://localhost/live/stream
