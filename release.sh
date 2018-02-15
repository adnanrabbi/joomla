#!/bin/bash
clear
#mkdir /var/resource/src /var/resource/mysql /var/resource/images /var/resource/cache
#chown -R 48.48 /var/resource/images /var/resource/cache

docker build -t "joomla:0.2" .
docker stop joomlacms db && docker rm joomlacms db
docker-compose -f docker-composer.yml down 
docker-compose -f docker-composer-release.yml up -d
