FROM php:8.2-fpm

COPY php.ini /usr/local/etc/php/php.ini

RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    vim \
    ca-certificates \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
