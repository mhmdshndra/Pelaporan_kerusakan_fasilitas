FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libicu-dev \
    libzip-dev \
    && docker-php-ext-install intl zip pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

RUN composer install --optimize-autoloader --no-interaction

EXPOSE 80

CMD ["sh", "-c", "php artisan optimize:clear && php artisan serve --host=0.0.0.0 --port=${PORT:-80}"]