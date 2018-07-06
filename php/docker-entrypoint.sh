#!/bin/bash
ln -sf /usr/local/php/lib/php.dev.ini /usr/local/php/lib/php.ini

if [ "php" = "$1" ];then
    exec "$@"
elif [ "phpunit" = "$1" ];then
    exec "$@"
else
    echo "error : run mode not in php-fpm,php,phpunit"
fi
