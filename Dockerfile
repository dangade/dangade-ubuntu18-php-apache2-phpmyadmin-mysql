#FROM php:7.3-apache
FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y php apache2 git php-mysql php-xdebug php-ldap php-pgsql php-mongodb unzip curl wget php-intl php-curl php-xml locate nano vim cron
RUN a2enmod rewrite
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/

EXPOSE 80
