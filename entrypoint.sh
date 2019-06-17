#!/bin/sh

set -ex

composer global require hirak/prestissimo --prefer-dist --no-interaction --no-suggest --no-progress
composer global require phpunit/phpunit ^8 --prefer-dist --no-interaction --no-suggest --no-progress

composer install --prefer-dist --no-interaction --no-suggest --no-progress

phpunit --testdox