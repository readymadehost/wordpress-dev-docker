FROM php:7.2-cli

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
    libssl-dev \
    git \
    vim \
    zip \
    unzip \
    wget \
    screenfetch \
    mariadb-client

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

# Installing composer
VOLUME /root/.composer/cache
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installing wordpress cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

ARG NODE_VERSION
ENV NODE_VERSION ${NODE_VERSION}

# Installing node
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash -
RUN apt-get -y install nodejs

# Manage project and add scripts
RUN mkdir /var/www/project
ADD manage-project-permission.sh /root/manage-project-permission.sh
RUN chmod +x /root/manage-project-permission.sh
RUN echo 'alias mpp="/root/manage-project-permission.sh"' >> /root/.bashrc
RUN /root/manage-project-permission.sh
ADD setup-new-project.sh /root/setup-new-project.sh
RUN chmod +x /root/setup-new-project.sh

ARG PHP_ENABLE_XDEBUG
ENV PHP_ENABLE_XDEBUG ${PHP_ENABLE_XDEBUG}

ADD docker-entrypoint.sh /root/docker-entrypoint.sh
RUN chmod +x /root/docker-entrypoint.sh

CMD ["/root/docker-entrypoint.sh", "bash"]
