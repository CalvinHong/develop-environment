FROM php:5.6.17-fpm
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
RUN curl -L -o redis.zip https://github.com/hongbinfu/phpredis/archive/2.2.7.zip
RUN unzip redis.zip \
    && rm -r redis.zip \
    && mv phpredis-2.2.7 /usr/src/php/ext/redis \
    && docker-php-ext-install redis
# Install xdebug
RUN curl -L -o xdebug-2.4.0rc3.tgz http://xdebug.org/files/xdebug-2.4.0rc3.tgz \
    && tar -zvxf xdebug-2.4.0rc3.tgz \
    && rm -r xdebug-2.4.0rc3.tgz \
    && mv xdebug-2.4.0RC3 /usr/src/php/ext/xdebug \
    && docker-php-ext-configure xdebug --disable-xdebug \
    && docker-php-ext-install xdebug    
RUN cd /usr/src/php/ext/mysqli \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install mysqli
CMD ["php-fpm"]