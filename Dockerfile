FROM ubuntu:20.04
RUN apt-get update && apt-get install -y php postgresql apache2 mcrypt php-libapache php7.0-pgsql pgsql
RUN apt-get install --no-install-recommends -y libpq-dev
RUN apt-get install -y postgresql-dev
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pgsql pdo_pgsql -y
EXPOSE 80
