FROM php:7.3-cli

RUN apt-get update
RUN apt-get install -y wget libpq-dev
RUN docker-php-ext-install pcntl pdo pdo_pgsql sockets bcmath
RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis
