FROM php:8.0-fpm

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive
ARG uid='1001'
ARG gid='1001'
ARG A_COMPOSER_HOME=/home/localUser/.composer
ARG GITHUB_TOKEN

RUN groupadd -g ${gid} localUser && \
    useradd -l -u ${uid} -g ${gid} -m -s /bin/bash localUser && \
    usermod -a -G www-data localUser

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN mkdir -p ${A_COMPOSER_HOME} && \
    if [ ! -z ${GITHUB_TOKEN} ]; then \
        composer config -g github-oauth.github.com ${GITHUB_TOKEN}; \
    fi && \
    chown localUser:localUser ${A_COMPOSER_HOME}

# Configure php-fpm
COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
RUN mkdir -p /var/run/php/ && chmod -R +X /var/run/php && chown localUser:localUser /var/run/php
