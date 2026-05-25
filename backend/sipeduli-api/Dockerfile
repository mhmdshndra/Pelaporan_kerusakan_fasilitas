FROM dunglas/frankenphp:1-php8.2

RUN install-php-extensions \
    pdo_mysql \
    intl \
    zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --no-interaction --optimize-autoloader

EXPOSE 80

CMD sh -c "php artisan migrate --force && php artisan octane:frankenphp --host=0.0.0.0 --port=${PORT:-80}"