FROM dunglas/frankenphp:php8.2

RUN install-php-extensions \
    pdo_mysql \
    intl \
    zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --optimize-autoloader --no-interaction

EXPOSE 80

CMD sh -c "php artisan optimize:clear && frankenphp php-server -r public/ --listen 0.0.0.0:${PORT:-80}"