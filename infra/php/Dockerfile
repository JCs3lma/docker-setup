FROM php:7.2-fpm

# Copy php.ini configuration
COPY php.ini /usr/local/etc/php/php.ini

# Update and install required packages
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    vim \
    ca-certificates \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
