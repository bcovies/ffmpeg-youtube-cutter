FROM php:7.4-apache

RUN apt-get -y update && \
    apt-get install -y ffmpeg && \
    apt-get install -y python-pip &&\
    pip install -U youtube-dl &&\
    apt-get install -y curl 
    
RUN mkdir -p /home/download && \
    mkdir -p /home/scripts

COPY --chown=1000:1000 ./php/index.html /var/www/html
COPY --chown=1000:1000 ./php/action.php /var/www/html
COPY --chown=1000:1000 ./download-and-cut.sh /home/scripts

RUN chmod 777 -R /home/scripts/download-and-cut.sh  && \
    chmod 777 -R /home/download 
      

