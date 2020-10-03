#!/bin/bash

echo "------------------------------------------"
echo "Installing new wordpress project"

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
wp --allow-root config set DB_NAME project
wp --allow-root config set DB_USER root
wp --allow-root config set DB_PASSWORD root
wp --allow-root config set DB_HOST mariadb
wp --allow-root config set WP_DEBUG 1
wp --allow-root config shuffle-salts

wp --allow-root config list

echo "- cleaning up"
rm -rf wordpress
rm latest.tar.gz

echo "- managing permission using /root/manage-project-permission.sh (mpp)"
/root/manage-project-permission.sh

echo "------------------------------------------"
