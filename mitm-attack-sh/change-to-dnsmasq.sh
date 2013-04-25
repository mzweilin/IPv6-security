#!/bin/bash

interface=eth0
addr=2013:face:dead:beef::1/64
dnsnameserver=2013:face:dead:beef::1
proxyserver=$dnsnameserver

sudo killall fake_dns6d

# dnsmasq
dnsmasq_conf="address=/baidu.com/${proxyserver}"

echo "$dnsmasq_conf" | sudo tee /etc/dnsmasq.conf
sudo service dnsmasq stop
sudo killall dnsmasq
resolv_conf=`cat /etc/resolv.conf`
sudo service dnsmasq restart
echo "$resolv_conf" | sudo tee /etc/resolv.conf
