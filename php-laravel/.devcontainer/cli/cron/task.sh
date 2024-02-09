#!/bin/sh

cd /workspaces/laravel/games && php artisan schedule:run >> /dev/null 2>&1
cd /workspaces/laravel/lottery-api && php artisan schedule:run >> /dev/null 2>&1
cd /workspaces/laravel/partnered && php artisan schedule:run >> /dev/null 2>&1