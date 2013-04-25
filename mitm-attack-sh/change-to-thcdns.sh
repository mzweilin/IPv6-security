#!/bin/bash

interface=eth0
addr=2013:face:dead:beef::1/64
dnsnameserver=2013:face:dead:beef::1
proxyserver=$dnsnameserver

sudo service dnsmasq stop
cd ~/coder/ipv6/thc-ipv6-2.1 
sudo ./fake_dns6d $interface ${proxyserver}
