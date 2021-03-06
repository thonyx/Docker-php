FROM ubuntu:16.04

MAINTAINER Anthony Rodriguez

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y install language-pack-en-base \
&& export LC_ALL=en_US.UTF-8 \
&& export LANG=en_US.UTF-8 
RUN apt-get install dialog apt-utils -y
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php 
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y php7.1-fpm php7.1-cli php7.1-mcrypt php7.1-mysql \
            php7.1-curl php-pear libssl-dev pkg-config zip unzip \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && echo "daemon off;" >> /etc/nginx/nginx.conf