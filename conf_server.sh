#!bin/bash

touch /etc/ntpd.conf
echo "servers pool.ntp.org" > /etc/ntpd.conf
