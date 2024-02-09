# From official php image.
FROM php:8.1-cli-alpine
ARG xdebug_enabled=false

# Create a user group and account under id 1000.
RUN addgroup -g 1000 -S user && adduser -u 1000 -D user -G user
# RUN usermod -aG sudo user

# Install quality-of-life packages.
RUN apk add --no-cache bash curl git nano 

# Installing composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN rm -rf composer-setup.php

# Install postgres pdo driver.
# RUN apk add --no-cache postgresql-dev && docker-php-ext-install pdo_pgsql

RUN apk update && \
    apk add bash build-base gcc wget git autoconf libmcrypt-dev libzip-dev zip \
    g++ make openssl-dev openssh-client

# php extensions    
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN docker-php-ext-install pcntl  
RUN docker-php-ext-install bcmath

# zip ext
RUN apk add --no-cache \
      libzip-dev \
      zip \
    && docker-php-ext-install zip

# RUN chmod +x /usr/local/bin/install-php-extensions && \
#     install-php-extensions gd xdebug pdo_mysql openssl zip
# Install redis driver.
# RUN mkdir -p /usr/src/php/ext/redis; \
#     curl -fsSL --ipv4 https://github.com/phpredis/phpredis/archive/5.3.4.tar.gz | tar xvz -C "/usr/src/php/ext/redis" --strip 1; \
#     docker-php-ext-install redis
# Install nodejs and npm for frontend.
COPY ./ext.conf /usr/local/etc/php/conf.d/
RUN apk add --no-cache nodejs npm

# protobuf
RUN apk add protoc

# git configs
RUN git config --global user.name "warren"
RUN git config --global user.email "warr@1bit.com.ph"


# add cron fo everyminute
RUN mkdir /etc/periodic/1min
COPY ./cron/. /etc/periodic/1min/
RUN chmod -R +x  /etc/periodic/1min
RUN echo "*       *       *       *       *       run-parts /etc/periodic/1min" >> /etc/crontabs/root
# Prevent container from exiting early.
CMD ["sleep", "infinity"]
