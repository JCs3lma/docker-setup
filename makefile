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
cache:
	docker compose exec php composer dump-autoload -o
	@make optimize
	docker compose exec php php artisan event:cache
	docker compose exec php php artisan view:cache
cache-clear:
	docker compose exec php composer clear-cache
	@make optimize-clear
	docker compose exec php php artisan event:clear
bootstrap-cache:
	docker compose exec php chmod -R 777 storage bootstrap/cache

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
stop:
	docker compose stop
down:
	docker compose down --remove-orphans
down-v:
	docker compose down --remove-orphans --volumes
up:
	docker compose up -d --build
build:
	docker compose build
	@make bootstrap-cache
	@make optimize-clear
restart:
	@make down
	@make up
prune:
	docker system prune -f
build-prod:
	docker compose -f docker-compose-prod.yml up -d --build
	@make bootstrap-cache
	@make optimize-clear