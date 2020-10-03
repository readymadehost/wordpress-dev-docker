#!/bin/bash

echo "------------------------------------------"
echo "Setting new wordpress project"

PROJECT_ROOT="/var/www/project"

cd ${PROJECT_ROOT}

echo "- downloading latest version"
curl -O https://wordpress.org/latest.tar.gz


echo "- decompressing latest.tar.gz"
tar -zxvf latest.tar.gz

echo "- copying wordpress files to respective dir"
cd wordpress
cp -rf . ..
cd ..

echo "- setting wp-config.php"
cp wp-config-sample.php wp-config.php
perl -pi -e "s/database_name_here/project/g" wp-config.php
perl -pi -e "s/username_here/root/g" wp-config.php
perl -pi -e "s/password_here/root/g" wp-config.php
perl -pi -e "s/localhost/mariadb/g" wp-config.php
perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' wp-config.php

echo "- cleaning up"
rm -rf wordpress
rm latest.tar.gz

echo "- managing permission using /root/manage-project-permission.sh (mpp)"
/root/manage-project-permission.sh

echo "------------------------------------------"
