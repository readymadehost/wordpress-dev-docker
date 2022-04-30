#!/bin/sh

if [ ${PHP_ENABLE_REDIS} -eq "1" ]; then
    docker-php-ext-enable redis
    echo "-- php fpm redis extension enabled"
fi

if [ ${PHP_ENABLE_XDEBUG} -eq "1" ]; then
    docker-php-ext-enable xdebug
    echo "-- php fpm xdebug extension enabled"
fi

exec "$@"