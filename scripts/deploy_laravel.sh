#!/bin/bash

# Enter html directory
cd /opt/bitnami/apache2/htdocs/

# Create cache and chmod folders
mkdir -p /opt/bitnami/apache2/htdocs/bootstrap/cache
mkdir -p /opt/bitnami/apache2/htdocs/storage/framework/sessions
mkdir -p /opt/bitnami/apache2/htdocs/storage/framework/views
mkdir -p /opt/bitnami/apache2/htdocs/storage/framework/cache
mkdir -p /opt/bitnami/apache2/htdocs/public/files/

# Install dependencies
export COMPOSER_ALLOW_SUPERUSER=1
composer install -d /opt/bitnami/apache2/htdocs/

# Copy configuration from /var/www/.env, see README.MD for more information
cp /var/www/.env /opt/bitnami/apache2/htdocs/.env

# Migrate all tables
php /opt/bitnami/apache2/htdocs/artisan migrate

# Clear any previous cached views
php /opt/bitnami/apache2/htdocs/artisan config:clear
php /opt/bitnami/apache2/htdocs/artisan cache:clear
php /opt/bitnami/apache2/htdocs/artisan view:clear

# Optimize the application
php /opt/bitnami/apache2/htdocs/artisan config:cache
php /opt/bitnami/apache2/htdocs/artisan optimize
#php /opt/bitnami/apache2/htdocs/artisan route:cache

# Change rights
chmod 777 -R /opt/bitnami/apache2/htdocs/bootstrap/cache
chmod 777 -R /opt/bitnami/apache2/htdocs/storage
chmod 777 -R /opt/bitnami/apache2/htdocs/public/files/

# Bring up application
php /opt/bitnami/apache2/htdocs/artisan up
