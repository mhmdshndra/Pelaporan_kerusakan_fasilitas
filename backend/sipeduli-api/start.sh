#!/bin/sh

php artisan optimize:clear

PORT_TO_USE=${PORT:-8080}

echo "Running on port $PORT_TO_USE"

php artisan serve --host=0.0.0.0 --port=$PORT_TO_USE