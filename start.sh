#!/bin/bash

if [[ "$#" -ne "2" ]]; then
    echo "usage: $0 start|stop|restart path-to-app"
    exit
fi


cd "$(dirname "$0")"

# Symfony application's path (absolute or relative)

export SYMFONY_APP_PATH="$(dirname $(find $2 -name symfony.lock -print -quit))"

case $1 in
    start) /Applications/Docker.app/Contents/Resources/bin/docker-compose up -d;;
    stop) /Applications/Docker.app/Contents/Resources/bin/docker-compose stop;;
    restart)
        /Applications/Docker.app/Contents/Resources/bin/docker-compose stop
        /Applications/Docker.app/Contents/Resources/bin/docker-compose up -d;;
esac

