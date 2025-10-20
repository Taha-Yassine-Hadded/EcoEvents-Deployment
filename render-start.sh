#!/usr/bin/env bash
set -o errexit

echo "🌟 Starting application..."

# Start PHP built-in server
php artisan serve --host=0.0.0.0 --port=${PORT:-8000}