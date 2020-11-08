#!/bin/bash

set -e

apt-get update && apt-get install -y \
    build-essential \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    git

# Clear cache
apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
docker-php-ext-install pdo_mysql zip exif pcntl
docker-php-ext-configure gd --with-freetype --with-jpeg

#RUN docker-php-ext-configure gd --enable-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
docker-php-ext-install gd

# Install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

php-fpm