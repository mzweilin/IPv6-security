#!/bin/bash

sudo service lighttpd stop

sudo killall squid3
sudo service squid3 restart
sudo ncat -l 80 -6 --exec "/usr/local/bin/ncat 127.0.0.1 3128" -k &
sudo tail -f /var/log/squid3/access.log
