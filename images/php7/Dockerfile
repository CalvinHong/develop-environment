FROM php:7.0.1-fpm
# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        zip \
        unzip \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
# Install php-redis
RUN curl -L -o redis.zip https://codeload.github.com/phpredis/phpredis/zip/php7
RUN unzip redis.zip \
    && rm -r redis.zip \
    && mv phpredis-php7 /usr/src/php/ext/redis \
    && docker-php-ext-install redis

COPY php.ini /usr/local/etc/php/conf.d/custom-setting.ini
CMD ["php-fpm"]