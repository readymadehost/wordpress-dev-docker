#!/bin/bash

/root/manage-project-permission.sh

if [ ${PHP_ENABLE_XDEBUG} -eq "1" ]; then
    docker-php-ext-enable xdebug
    echo "-- php cli xdebug extension enabled"
fi

tail -f /dev/null
