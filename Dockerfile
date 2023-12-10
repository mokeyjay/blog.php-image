FROM php:8.2.13-fpm-bullseye

RUN apt update && \
    apt install -y nginx cron git iputils-ping procps wget curl vim

RUN docker-php-ext-install -j$(nproc) bcmath calendar exif gettext sockets dba pcntl pdo_mysql shmop sysvmsg sysvsem sysvshm iconv

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions redis imagick mcrypt zip @composer gmp gd

LABEL Author="mokeyjay<i@mokeyjay.com>"
LABEL Version="2023.12.10"
LABEL Description="博客运行环境"