#!/bin/bash




mkdir -p /etc/net/ifaces/ens19
mkdir -p /etc/net/ifaces/gre1

echo "192.168.3.1/28" > /etc/net/ifaces/ens19/ipv4address

echo "TYPE=eth" > /etc/net/ifaces/ens19/options


echo "10.10.0.2/30" > /etc/net/ifaces/gre1/ipv4address

echo -e "TYPE=iptun \nTUNTYPE=gre \nTUNLOCAL=172.16.50.5 \nTUNREMOTE=172.16.40.4 \nTUNTTL=64 \nTUNOPTIONS='ttl 64' \nDISABLE=no " > /etc/net/ifaces/gre1/options

 

systemctl restart network
