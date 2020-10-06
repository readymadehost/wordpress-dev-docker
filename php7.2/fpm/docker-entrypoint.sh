#!/bin/bash

if [ ${PHP_ENABLE_XDEBUG} -eq "1" ]; then
    docker-php-ext-enable xdebug
    echo "-- php fpm xdebug extension enabled"
fi

exec "$@"
