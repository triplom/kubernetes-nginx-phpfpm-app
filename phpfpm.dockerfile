# Use PHP 8.3.4 FPM as base image
FROM php:8.3.4-fpm

# Install necessary dependencies and PHP extensions
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        wget \
        build-essential \
        software-properties-common \
        tzdata \
        libpng-dev \
        libjpeg-dev \
        libpq-dev \
        libfreetype6-dev \
        libonig-dev \
        libmcrypt-dev \
        libtidy-dev \
        libzip-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
        pdo_mysql \
        pdo_pgsql \
        gd \
        intl \
        mcrypt \
        tidy \
        zip

# Set timezone
ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Configure PHP
RUN sed -i "s/;date.timezone =.*/date.timezone = \$TZ/" /usr/local/etc/php/php.ini
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /usr/local/etc/php/php.ini

# Expose port if needed (not required for PHP CLI or FPM)
# EXPOSE 9000

# Start PHP-FPM (if needed) and keep the container running
# CMD ["php-fpm"]
CMD ["php", "-S", "0.0.0.0:9000", "-t", "/var/www/html"]
