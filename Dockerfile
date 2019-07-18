FROM php:7.3-cli-alpine
#FROM php:7.3-cli

WORKDIR /app

ENTRYPOINT ["php", "service.php"]

#RUN apt-get update
#RUN apt-get install -y wget libpq-dev
#RUN docker-php-ext-install pcntl pdo pdo_pgsql sockets bcmath gmp
#RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis

RUN apk update \
 && apk add wget postgresql-dev autoconf g++ make gmp-dev \
 && docker-php-ext-install pcntl pdo pdo_pgsql sockets bcmath gmp \
 && pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis \
 && apk del autoconf g++ make
