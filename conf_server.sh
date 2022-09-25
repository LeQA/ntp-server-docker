#!bin/bash

mkdir ntp-server
touch ntp-server/Dockerfile

echo "FROM alpine" >> ntp-server/Dockerfile
echo "RUN apk update" >> ntp-server/Dockerfile
echo "RUN apk add openntpd" >> ntp-server/Dockerfile
echo "ENTRYPOINT ["ntpd"] >> ntp-server/Dockerfile

touch /etc/ntpd.conf
echo "servers pool.ntp.org" > /etc/ntpd.conf

docker build -t ntp-server
docker run --privileged -v /var/empty \
  -v /etc/ntpd.conf:/etc/ntpd.conf ntp-server -d -f /etc/ntpd.conf -s
