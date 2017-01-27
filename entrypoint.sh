#!/bin/bash

set -e

sed -i "s/172\.17\.0\.1/$DB_HOST/g" /tmp/war/WEB-INF/classes/JKEDB.properties
LOC=$(pwd)
cd /tmp/war
zip -r /tmp/jke.war ./*
cp /tmp/jke.war /config/dropins/
cd $LOC
exec /opt/ibm/docker/docker-server run defaultServer