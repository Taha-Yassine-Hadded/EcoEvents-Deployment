#!/usr/bin/env bash
set -o errexit

echo "🚀 Starting build process..."

# Update package lists
apt-get update

# Install Node.js 20 (required for Vite)
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

# Verify installations
echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"
echo "PHP version: $(php -v)"

# Install Composer dependencies
echo "📦 Installing Composer dependencies..."
composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# Install NPM dependencies
echo "📦 Installing NPM dependencies..."
npm ci

# Build Vite assets
echo "🎨 Building Vite assets..."
npm run build

# Laravel optimization
echo "⚡ Optimizing Laravel..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Run migrations
echo "🗄️  Running migrations..."
php artisan migrate --force --no-interaction

# Create storage link
php artisan storage:link

echo "✅ Build completed successfully!"