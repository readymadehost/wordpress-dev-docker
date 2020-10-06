FROM php:7.3-fpm

LABEL maintainer="ReadyMadeHost http://readymadehost.com"

# Installing required packages
RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apt-transport-https \
	libicu-dev \
    libonig-dev \
    libzip-dev \
    libpng-dev \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev

# Installing extensions
RUN docker-php-ext-install \
	mysqli \
	intl \
	mbstring \
	zip \
	exif \
	pcntl \
	bcmath \
	opcache \
	gd

# Installing other extensions but enabled dynamically
RUN pecl install xdebug
# RUN docker-php-ext-enable xdebug

# Updating php.ini
ADD conf/php.ini /usr/local/etc/php/php.ini

ARG PHP_ENABLE_XDEBUG
ENV PHP_ENABLE_XDEBUG ${PHP_ENABLE_XDEBUG}

# Add scripts
ADD docker-entrypoint.sh /root/docker-entrypoint.sh
RUN chmod +x /root/docker-entrypoint.sh

CMD ["/root/docker-entrypoint.sh", "php-fpm", "-F"]
