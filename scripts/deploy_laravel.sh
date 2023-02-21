#!/bin/bash

# Enter html directory
cd /var/www/html/

# Create cache and chmod folders
mkdir -p /opt/bitnami/apache2/htdocsbootstrap/cache
mkdir -p /opt/bitnami/apache2/htdocsstorage/framework/sessions
mkdir -p /opt/bitnami/apache2/htdocsstorage/framework/views
mkdir -p /opt/bitnami/apache2/htdocsstorage/framework/cache
mkdir -p /opt/bitnami/apache2/htdocspublic/files/
mkdir -p /opt/bitnami/apache2/htdocspublic/prueba/


# # Install dependencies
# export COMPOSER_ALLOW_SUPERUSER=1
# composer install -d /var/www/html/

# # Copy configuration from /var/www/.env, see README.MD for more information
# cp /var/www/.env /var/www/html/.env

# # Migrate all tables
# php /var/www/html/artisan migrate

# # Clear any previous cached views
# php /var/www/html/artisan config:clear
# php /var/www/html/artisan cache:clear
# php /var/www/html/artisan view:clear

# # Optimize the application
# php /var/www/html/artisan config:cache
# php /var/www/html/artisan optimize
# #php /var/www/html/artisan route:cache

# # Change rights
# chmod 777 -R /var/www/html/bootstrap/cache
# chmod 777 -R /var/www/html/storage
# chmod 777 -R /var/www/html/public/files/

# # Bring up application
# php /var/www/html/artisan up
