FROM php:7.4.4-apache
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
      libpq-dev \
      pgsql \
      php7.0-pgsql
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql 
RUN docker-php-ext-install \
  pdo \
  pdo_pgsql \
  pgsql \
  php7.0-pgsql
RUN set -ex && apk --no-cache add postgresql-dev
RUN docker-php-ext-install mysqli
