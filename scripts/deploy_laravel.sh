!/bin/bash

# Enter html directory
cd htdocs

# Create cache and chmod folders
mkdir -p htdocs/bootstrap/cache
mkdir -p htdocs/storage/framework/sessions
mkdir -p htdocs/storage/framework/views
mkdir -p htdocs/storage/framework/cache
mkdir -p htdocs/public/files/

# Install dependencies
export COMPOSER_ALLOW_SUPERUSER=1
composer install -d htdocs/

# Copy configuration from /var/www/.env, see README.MD for more information
cp /var/www/.env htdocs/.env

# Migrate all tables
php htdocs/artisan migrate

# Clear any previous cached views
php htdocs/artisan config:clear
php htdocs/artisan cache:clear
php htdocs/artisan view:clear

# Optimize the application
php htdocs/artisan config:cache
php htdocs/artisan optimize
#php htdocs/artisan route:cache

# Change rights
chmod 777 -R htdocs/bootstrap/cache
chmod 777 -R htdocs/storage
chmod 777 -R htdocs/public/files/

# Bring up application
php htdocs/artisan up
