#!/bin/bash

mysql_secure_installation << EOF

Y
iforgot
iforgot
Y
Y
Y
Y
Y
EOF

mysql -uroot -piforgot -e "create user wordpress identified by 'iforgot'"
mysql -uroot -piforgot -e "grant all privileges on wordpress.* to 'wordpress'@'%' identified by 'iforgot'"
mysql -uroot -piforgot -e "create database wordpress"
