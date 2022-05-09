# Copyright (c) 2022 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# django_oracle_linux_config.sh 
#
# Purpose: This script encapsulates the install and config of django deployment environment



echo "[1/5] Updating Package Repository"
sudo yum update -y
echo "[1/5] Done"

echo "[2/5] Installing NGINX Suite"
sudo yum install -y nginx
sudo systemctl enable --now nginx.service
echo "[2/5] Done"

echo "[3/5] Updating Firewall Rules for NGINX"
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
echo "[3/5] Done"

echo "[4/5] Downloading Python and dependencies"
sudo yum install python3.8 -y
sudo alternatives --set python /usr/bin/python3.8
sudo alternatives --set python3 /usr/bin/python3.8
sudo yum install python38-pip -y

python3 --version
pip3 --version

sudo pip3 install django==4.0
django-admin startproject setup
cd setup
python3 manage.py startapp core
cd ..
sudo rm -rf setup

sudo pip3 install gunicorn
echo "[4/5] Done"

echo "[5/5] Updating NGINX to use NFS"
sudo rm -rf /var/www
sudo ln -s /u01/ /var/www
sudo mkdir -p /var/www/cgi-bin
sudo mkdir -p /var/www/html

sudo yum provides /usr/sbin/semanage
sudo yum install policycoreutils-python-utils -y
sudo semanage fcontext -a -t httpd_sys_content_t '/var/www(/.*)?'
sudo restorecon -Rv /var/www
sudo systemctl restart nginx
echo "[5/5] Done"

