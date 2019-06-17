FROM php:7.3-alpine


ENV COMPOSER_ALLOW_SUPERUSER 1

LABEL "com.github.actions.name"="Trigger PHPUnit test"
LABEL "com.github.actions.description"="GitHub Action for triggering a test using PHPUnit 8"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="blue"
LABEL "repository"="https://github.com/linuxjuggler/phpunit-action"
LABEL "homepage"="https://github.com/linuxjuggler"
LABEL "maintainer"="Zaher Ghaibeh <zaher@zah.me>"

RUN set -ex \
  	&& apk update \
    && apk add --no-cache git curl openssh-client icu libpng freetype libzip \
       libjpeg-turbo libffi-dev libsodium \
    && apk add --no-cache --virtual build-dependencies icu-dev libxml2-dev freetype-dev libzip-dev libpng-dev \
        libjpeg-turbo-dev g++ make autoconf libsodium-dev\
    && docker-php-source extract \
    && pecl install redis libsodium xdebug \
    && docker-php-ext-enable xdebug redis sodium \
    && docker-php-source delete \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) pdo intl zip gd \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && cd  / && rm -fr /src \
    && apk del build-dependencies \
    && rm -rf /tmp/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]