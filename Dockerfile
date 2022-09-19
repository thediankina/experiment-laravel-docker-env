FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    php \
    php-cli \
    php-dev \
    php-common \
    php-intl \
    php-json \
    php-gd \
    php-zip \
    php-xml \
    php-curl \
    php-tokenizer \
    php-bcmath \
    php-mbstring \
    php-pgsql \
    unzip \
    nginx

RUN apt-get clean && apt-get -y autoremove

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# While Laravel is not initialized
CMD [ "bash", "-c", "localhost:80" ]
# CMD [ "bash", "-c", "php artisan serve --host=0.0.0.0 --port=80" ]

# .env: DB_HOST=<project-name>-database-1
