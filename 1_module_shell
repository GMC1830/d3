 1 module

login password > root toor

Для HQ-CLI login password > user resu

## ISP

перезапустили поосле настрройки isp reboot , а то что то не применяется, хз

apt-get update

apt-get install -y wget

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/isp.sh

chmod +x ./isp.sh

./isp.sh

---------------------------------------------------------

reboot

---------------------------------------------------------

## HQ-rtr

timedatectl set-timezone Asia/Vladivostok

echo 172.16.40.4/28 > /etc/net/ifaces/ens18/ipv4address

echo default via 172.16.40.1 > /etc/net/ifaces/ens18/ipv4route

echo "TYPE=eth" > /etc/net/ifaces/ens18/options

mkdir -p /etc/net/ifaces/ens19

mkdir -p /etc/net/ifaces/gre1

mkdir -p /etc/net/ifaces/vlan100

mkdir -p /etc/net/ifaces/vlan200

mkdir -p /etc/net/ifaces/vlan99

echo -e "BOOTPROTO=static \nTYPE=eth" > /etc/net/ifaces/ens19/options

echo "10.10.0.1/30" > /etc/net/ifaces/gre1/ipv4address

echo -e "TYPE=iptun \nTUNTYPE=gre \nTUNLOCAL=172.16.40.4 \nTUNREMOTE=172.16.50.5 \nTUNTTL=64 \nTUNOPTIONS='ttl 64' \nDISABLE=no' " > /etc/net/ifaces/gre1/options

echo 192.168.1.1/27 > /etc/net/ifaces/vlan100/ipv4address

echo -e "TYPE=vlan \nHOST=ens19 \nVID=100" > /etc/net/ifaces/vlan100/options

echo -e "search au-team.irpo \nnameserver 192.168.1.10" > /etc/net/ifaces/vlan100/resolv.conf

echo 192.168.2.1/28 > /etc/net/ifaces/vlan200/ipv4address

echo -e "TYPE=vlan \nHOST=ens19 \nVID=200" > /etc/net/ifaces/vlan200/options

echo 192.168.99.1/28 > /etc/net/ifaces/vlan99/ipv4address

echo -e "TYPE=vlan \nHOST=ens19 \nVID=99" > /etc/net/ifaces/vlan99/options

sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/net/sysctl.conf

iptables -t nat -A POSTROUTING -j MASQUERADE

iptables-save >> /etc/sysconfig/iptables

systemctl enable iptables

systemctl restart iptables

service iptables restart

service iptables restart

systemctl restart network

hostnamectl set-hostname br-rtr.au-team.irpo; exec bash

## переходим в hq-srv 

timedatectl set-timezone Asia/Vladivostok

hostnamectl set-hostname hq-srv.au-team.irpo; exec bash

echo -e "BOOTPROTO=static \nTYPE=eth" > /etc/net/ifaces/ens18/options

echo 192.168.1.10/27 > /etc/net/ifaces/ens18/ipv4address 

echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo default via 192.168.1.1> /etc/net/ifaces/ens18/ipv4route

systemctl restart network

apt-get update

apt-get install -y wget

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/hqsrvDNS.sh

chmod +x ./hqsrvDNS.sh

./hqsrvDNS.sh

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/srv_acc.sh

chmod +x ./srv_acc.sh

./srv_acc.sh

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/ssh_srv.sh

chmod +x ./ssh_srv.sh

./ssh_srv.sh

# на HQ-rtr

echo -e "search au-team.irpo \nnameserver 192.168.1.10" > /etc/resolv.conf

apt-get update

apt-get install -y wget

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/dhcphqrtr.sh

chmod +x ./dhcphqrtr.sh

./dhcphqrtr.sh

echo -e "search au-team.irpo \nnameserver 192.168.1.10" > /etc/resolv.conf

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/rtracc.sh

chmod +x ./rtracc.sh

./rtracc.sh

echo -e "search au-team.irpo \nnameserver 192.168.1.10" > /etc/resolv.conf

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/oshq.sh

chmod +x ./oshq.sh

./oshq.sh

echo -e "search au-team.irpo \nnameserver 192.168.1.10" > /etc/resolv.conf

## HQ-cli

timedatectl set-timezone Asia/Vladivostok

hostnamectl set-hostname hq-cli.au-team.irpo; exec bash

systemctl restart network

### проверить

тут важно ,  

проверить КОМАНДОЙ  ip -c a 

адресс выданный с dhcp , если  192.168.2.11 , и  совпадет не меняем , 


если нет то

меняем его в hq-srv по пути /etc/dnsmasq.conf

в строке с  "host-record=hq-cli.au-team.irpo,192.168.2.11"

смериям адресс , вписываем ИЗ hq-cli 

перезагружаем после изменения systemctl restart dnsmasq

когда ip правильный , пинговать будет по имени

## BR-rtr

timedatectl set-timezone Asia/Vladivostok

echo "172.16.50.5/28" > /etc/net/ifaces/ens18/ipv4address

echo "default via 172.16.50.1" > /etc/net/ifaces/ens18/ipv4route

echo "TYPE=eth" > /etc/net/ifaces/ens18/options

echo -e "nameserver 8.8.8.8" > /etc/resolv.conf

systemctl restart network

sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/net/sysctl.conf

iptables -t nat -A POSTROUTING -j MASQUERADE

iptables-save >> /etc/sysconfig/iptables

systemctl enable iptables

systemctl restart iptables

service iptables enable

apt-get update

apt-get install -y wget 

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/b_rt.sh

chmod +x ./b_rt.sh

./b_rt.sh

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/rtracc.sh

chmod +x ./rtracc.sh

./rtracc.sh

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/br_ospf.sh

chmod +x ./br_ospf.sh

./br_ospf.sh

echo -e "search au-team.irpo \nnameserver 192.168.1.10" > /etc/resolv.conf

hostnamectl set-hostname br-rtr.au-team.irpo; exec bash

## br-srv

timedatectl set-timezone Asia/Vladivostok

hostnamectl set-hostname br-srv.au-team.irpo; exec bash

echo -e "BOOTPROTO=static \nTYPE=eth" > /etc/net/ifaces/ens18/options 

echo 192.168.3.10/27> /etc/net/ifaces/ens18/ipv4address 

echo default via 192.168.3.1> /etc/net/ifaces/ens18/ipv4route

echo -e "nameserver 8.8.8.8" > /etc/resolv.conf

systemctl restart network

apt-get update

apt-get install -y wget

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/srv_acc.sh

chmod +x ./srv_acc.sh

./srv_acc.sh

echo -e "search au-team.irpo \nnameserver 192.168.1.10" > /etc/resolv.conf


wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/1/ssh_srv.sh

chmod +x ./ssh_srv.sh

./ssh_srv.sh


//чистим следы

ls

rm -f NAMEFILE.SH

history -c




