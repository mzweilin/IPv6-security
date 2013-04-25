#!/bin/bash

sudo killall ncat
sudo service squid3 stop
sudo service lighttpd restart
