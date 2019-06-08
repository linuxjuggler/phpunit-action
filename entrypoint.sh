#!/bin/sh

set -ex

composer self-update

composer global require hirak/prestissimo

composer update --prefer-dist --no-interaction --prefer-stable --no-suggest

php ./vendor/bin/phpunit --testdox