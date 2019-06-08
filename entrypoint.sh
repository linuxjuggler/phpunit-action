#!/bin/sh

set -ex

composer self-update

composer global require hirak/prestissimo --prefer-dist --no-interaction --prefer-stable --no-suggest --no-progress

composer install --prefer-dist --no-interaction --prefer-stable --no-suggest --no-progress

php ./vendor/bin/phpunit --testdox