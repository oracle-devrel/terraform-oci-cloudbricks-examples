# Copyright (c) 2021 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# linux_lamp_config.sh 
#
# Purpose: This script encapsulates the install and config of LAMP stack

echo "[1/7] Updating Package Repository"
sudo yum update -y
echo "[1/7] Done"

echo "[2/7] Installing Apache Suite"
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl restart httpd
echo "[2/7] Done"

echo "[3/7] Updating Firewall Rules"
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
echo "[3/7] Done"

echo "[4/7] Installing PHP Suite"
sudo yum install -y oracle-php-release-el7
sudo yum install -y php
echo "[4/7] Done"

echo "[5/7] Updating Apache to use NFS"
sudo rm -rf /var/www
sudo ln -s /u01/ /var/www
sudo mkdir -p /var/www/cgi-bin
sudo mkdir -p /var/www/html

sudo semanage fcontext -a -t httpd_sys_content_t "/var/www(/./)?"
sudo restorecon -R /var/www
sudo setsebool -P httpd_use_nfs on
sudo systemctl restart httpd
echo "[5/7] Done"

echo "[6/7] Creating PHP Testing File"
php -v
echo '<?php phpinfo(); ?>' | sudo tee -a /var/www/html/info.php > /dev/null
echo "[6/7] Done"

echo "[7/7] Installing MySQL via MariaDB"
sudo yum install mariadb-server mariadb -y
sudo systemctl start mariadb
sudo systemctl status mariadb
(echo -ne '\n'; echo Y; echo $1; echo $1; echo Y; echo Y; echo Y; echo Y) | sudo mysql_secure_installation
sudo systemctl enable mariadb.service
echo "[7/7] Done"