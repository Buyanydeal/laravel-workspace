##############################
## Image Setup ###############
##############################

FROM phusion/baseimage:0.11

LABEL maintainer="Ruud van Engelenhoven <ruud.vanengelenhoven@gmail.com>"

RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

## PHP 7 PPA Installation ####
RUN apt-get install -y software-properties-common --no-install-recommends && \
    add-apt-repository -y ppa:ondrej/php

## Software Installation #####
RUN apt-get update && \
    apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --no-install-recommends \
    php7.2-cli \
    php7.3-common \
    php7.3-curl \
    php7.3-intl \
    php7.3-json \
    php7.3-xml \
    php7.3-mbstring \
    php7.3-mysql \
    php7.3-pgsql \
    php7.3-sqlite \
    php7.3-sqlite3 \
    php7.3-zip \
    php7.3-bcmath \
    php7.3-memcached \
    php7.3-gd \
    php7.3-dev \
    pkg-config \
    libcurl4-openssl-dev \
    libedit-dev \
    libssl-dev \
    libxml2-dev \
    xz-utils \
    libsqlite3-dev \
    sqlite3 \
    git \
    curl \
    vim \
    nano \
    postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

## Composer Installation #####
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

RUN . ~/.bashrc