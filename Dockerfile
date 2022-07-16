FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y git build-essential ffmpeg libpcre3 libpcre3-dev libssl-dev zlib1g-dev 
RUN git clone https://github.com/sergey-dryabzhinsky/nginx-rtmp-module.git
RUN apt-get install -y curl \
    && curl -LO http://nginx.org/download/nginx-1.17.6.tar.gz \
    && tar -xf nginx-1.17.6.tar.gz 
RUN cd nginx-1.17.6 && \
    ./configure --prefix=/usr/local/nginx --with-http_ssl_module --add-module=../nginx-rtmp-module \
    && make install \  
    && rm /usr/local/nginx/conf/nginx.conf

EXPOSE 1935
COPY nginx.conf  /usr/local/nginx/conf/nginx.conf
RUN mkdir /var/log/nginx
CMD ["/usr/local/nginx/sbin/nginx"]