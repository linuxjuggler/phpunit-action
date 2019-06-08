#!/bin/sh

set -ex

composer global require hirak/prestissimo --prefer-dist --no-interaction --no-suggest --no-progress

composer install --prefer-dist --no-interaction --no-suggest --no-progress

php ./vendor/bin/phpunit --testdox