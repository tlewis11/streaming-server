# Streaming server using Docker, NGINX, and RTMP.


# Getting started
1. Build the Docker image and run the server locally

  ```
  docker build -t stream-server .
  docker run -p1935:1935 -it stream-server
  ```
  or run [this convienence script](build_and_run_stream_server.sh)

2. Stream to the server at rtmp://localhost:1935/live/stream
  You can run the provided [test_stream.sh script](test_stream.sh) to stream a local file to the server at rtmp://localhost:1935/live/stream using ffmpeg.

  ```
  # replace the video file path with one on your file system
  # the local file will be streamed to rtmp://localhost:1935/live/stream
  sh test_stream.sh data/sample_football_video.mp4
  ```

3. View the stream in your media player.

Point your video player to rtmp://localhost:1935/live/stream and press play.  You should see the video playing in your media player.



