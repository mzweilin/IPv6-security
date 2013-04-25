#!/bin/bash

interface=eth0
addr=2013:face:dead:beef::1/64
dnsnameserver=2013:face:dead:beef::1
proxyserver=$dnsnameserver

#
sudo service wide-dhcpv6-server stop

# open ipv6 forwarding
sudo sysctl -w net.ipv6.conf.all.forwarding=1

# add ipv6 address to the interface
sudo ip -6 addr add ${addr} dev $interface

radvd_conf="interface $interface {
	AdvSendAdvert on;
	AdvOtherConfigFlag on;
	MinRtrAdvInterval 3;
	MaxRtrAdvInterval 10;
	prefix ${addr} {
		AdvOnLink on;
		AdvAutonomous on;
		AdvRouterAddr on;
	};
};"

# keep the \n
echo "$radvd_conf" | sudo tee /etc/radvd.conf

sudo service radvd restart

sudo ip -6 route add local default dev lo table 100
sudo ip -6 rule add iif eth0 lookup 100

