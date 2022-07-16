docker build -t stream-server . || exit "build failed. exiting."
docker run -p1935:1935 -d -t stream-server || exit "failed to run the docker image. exiting."
