## HQ-RTR -
apt-get update && apt-get install -y wget

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/111hq.sh

chmod +x ./111hq.sh

./111hq.sh

## BR-RTR

apt-get update && apt-get install -y wget

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/111br-rtr.sh

chmod +x ./111br-rtr.sh

./111br-rtr.sh

## HQ-SRV

apt-get update && apt-get install -y wget

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/11hq-srv.sh

chmod +x ./11hq-srv.sh

./11hq-srv.sh

##  hq-srv

apt-get install -y apache2 php8.2 apache2-mod_php8.2 mariadb-server php8.2-opcache php8.2-curl php8.2-gd php8.2-intl php8.2-mysqli php8.2-xml php8.2-xmlrpc php8.2-ldap php8.2-zip php8.2-soap php8.2-mbstring php8.2-json php8.2-xmlreader php8.2-fileinfo php8.2-sodium php8.2-exif wget nano

-------------------------------------------------------------------------------------

systemctl enable --now httpd2 mysqld mariadb

-------------------------------------------------------------------------------------

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/1.sh

chmod +x ./1.sh

./1.sh

-------------------------------------------------------------------------------------

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/2.sh

chmod +x ./2.sh

./2.sh

-------------------------------------------------------------------------------------

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/3.sh

chmod +x ./3.sh

./3.sh

-------------------------------------------------------------------------------------

На hq-cli переходим по 192.168.1.10/moodle/install.php

тип бд maria

название бд moodledb

пользователь moodle

пароль P@ssw0rd

## HQ-CLI

systemctl start --now sshd

systemctl restart sshd

epm update

epm -y install yandex-browser-stable &

## BR-SRV

apt-get update && apt-get install -y wget

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/1br-srv.sh

chmod +x ./1br-srv.sh

./1br-srv.sh

-------------------------------------------------------------------------------------------------------


ansible all -m ping  , чтобы было pong , если нет то 

заходим на пк где проблема

ip -c a , узнать ip 

systemctl restart sshd

systemctl status sshd

и на br srv выполняем с тем ip (@ip) на который не прошло

ssh-copy-id -i /root/.ssh/id_rsa.pub -p 3015 sshuser@192.168.1.10

ssh-copy-id -i /root/.ssh/id_rsa.pub user@192.168.2.10

ssh-copy-id -i /root/.ssh/id_rsa.pub net_admin@172.16.4.4

ssh-copy-id -i /root/.ssh/id_rsa.pub net_admin@172.16.5.5

ssh-copy-id -i /root/.ssh/id_rsa.pub -p 3015 sshuser@192.168.3.10


-------------------------------------------------------------------------------------------------------

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/1wwiki.sh

chmod +x ./1wwiki.sh

./1wwiki.sh

## hq-cli 192.168.3.10:8086

Тип базы данных: MariaDB

Хост базы данных: mariadb

(имя сервиса Docker).

Имя базы данных: mediawiki

Пользователь базы данных: wiki

Пароль пользователя базы данных: WikiP@ssw0rd

Установите флажок "Использовать ту же учётную запись, что и для установки".

Нажмите "Continue".

Название и учётная запись:

Название вики: Wiki

Имя пользователя (администратора): wikiadmin.

Пароль: WikiP@$$w0rd.

Адрес email: admin@example.com

Выберите "Хватит уже, просто установите вики".

scp -P 3015 /home/user/Downloads/LocalSettings.php sshuser@192.168.3.10:/home/sshuser/

## BR-SRV


apt-get install nano

nano /home/sshuser/wiki.yml

где есть localsettings.php 

убираем # ( стираем знак) и - (тире) чтоб была под верхней тере

![так](https://github.com/GMC1830/d3/blob/main/image/111.jpg)


docker compose -f /home/sshuser/wiki.yml stop


docker compose -f /home/sshuser/wiki.yml up -d


## HQ-CLI

apt-get update && apt-get install -y chrony

cat <<'EOF' > /etc/chrony.conf

server 192.168.2.1 iburst

driftfile /var/lib/chrony/drift

makestep 1.0 3

rtcsync

logdir /var/log/chrony

EOF

systemctl enable --now chronyd

chronyc burst 4/10

system-auth write ad au-team.irpo hq-cli AU-TEAM 'administrator' 'P@ssw0rd'

sleep 5

.........................................

reboot

.........................................

wget https://raw.githubusercontent.com/GMC1830/d3/refs/heads/main/2/2hq-cli.sh

chmod +x ./2hq-cli.sh

./2hq-cli.sh
