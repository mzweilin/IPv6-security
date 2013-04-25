#!/bin/bash

interface=eth0
addr=2013:face:dead:beef::1/64
dnsnameserver=2013:face:dead:beef::1
proxyserver=$dnsnameserver


sudo service dnsmasq stop
sudo killall dnsmasq
sudo service radvd stop
sudo service wide-dhcpv6-server stop
#sudo service squid3 stop

sudo ip -6 addr del $addr dev $interface
