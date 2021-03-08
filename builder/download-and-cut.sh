#!/bin/bash

echo -e "Iniciando Script!\n"

BEGIN_TIME=$1
END_TIME=$2
URL_YOUTUBE=$3
PATH_DOWNLOAD="/home/download"
PATH_HTTPD="/var/www/html"
NOME_VIDEO="video.mp4"

echo "=========================================================="
echo -e "\nValores de entrada: \n\tTempo de início: $BEGIN_TIME\n\tTempo de fim: $END_TIME\n\tURL do youtube: $URL_YOUTUBE"
echo "=========================================================="

if [[ -f $PATH_HTTPD/$NOME_VIDEO ]]; then
    ls -lth $PATH_HTTPD/$NOME_VIDEO
    rm -rf $PATH_HTTPD/$NOME_VIDEO
fi

if curl --output /dev/null --silent --head --fail "$URL_YOUTUBE"; then
    echo -e "\nURL retornou código válido."
    echo -e "\n\tComeçando a baixar o vídeo $URL_YOUTUBE\n\n"
    echo "=========================================================="
    youtube-dl -o "/home/download/$NOME_VIDEO"  --format mp4 $URL_YOUTUBE
    echo "=========================================================="
    echo -e "\nVerificando se o arquivo realmente existe:\n"

    if [[ -f $PATH_DOWNLOAD/$NOME_VIDEO ]]; then
        echo -e "\n\nCortando o vídeo!"
        ffmpeg -i $PATH_DOWNLOAD/$NOME_VIDEO -ss $BEGIN_TIME -to $END_TIME -async 1 -strict -2 $PATH_HTTPD/$NOME_VIDEO
        echo "=========================================================="
        rm -rf $PATH_DOWNLOAD/$NOME_VIDEO
    fi
else
    echo "URL does not exist: $URL_YOUTUBE"
fi
