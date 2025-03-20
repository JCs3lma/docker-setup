FROM php:7.4-fpm

# Comment out this one if using port 9000
RUN sed -i 's/9000/9001/' /usr/local/etc/php-fpm.d/zz-docker.conf

# Copy php.ini configuration
COPY php.ini /usr/local/etc/php/php.ini

# Update and install required packages
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    vim \
    ca-certificates \
    net-tools \
    nano \
    ffmpeg \
    wget \
    gcc \
    make \
    autoconf \
    libtool \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["php-fpm"]

# Comment out if using 9000
EXPOSE 9001
