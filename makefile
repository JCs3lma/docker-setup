.PHONY: php
.PHONY: node
.PHONY: mysql
.PHONY: nginx
# Opening editors
php:
	docker compose exec php bash
node:
	docker compose exec node sh
nginx:
	docker compose exec nginx sh
mysql:
	docker compose exec mysql bash

# For PHP
optimize-clear:
	docker compose exec php php artisan optimize:clear
composer-install:
	docker compose exec php composer install
composer-dump-autoload:
	docker compose exec php composer dump-autoload
log-php-watch:
	docker compose logs --follow php
log-php:
	docker compose logs php
route-list:
	docker compose exec php php artisan route:list

# For nginx
log-nginx-watch:
	docker compose logs --follow nginx
log-nginx:
	docker compose logs nginx

# For Docker
logs:
	docker compose logs
logs-watch:
	docker compose logs --follow
ps:
	docker compose ps
