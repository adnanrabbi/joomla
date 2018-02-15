#!/bin/bash
clear
rm -rf /var/resource/
mkdir /var/resource/  /var/resource/src /var/resource/mysql /var/resource/images /var/resource/cache
chown -R 48.48 /var/resource/images /var/resource/cache

docker build -t "joomla:0.1" .
docker pull mysql
docker pull phpmyadmin/phpmyadmin
docker-compose -f docker-composer.yml up -d
