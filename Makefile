ARG =

## Commands
start:
	cd laradock; docker-compose up -d nginx mariadb

stop:
	cd laradock; docker-compose down

restart:
	make stop
	make start

run:
	cd laradock; docker-compose exec workspace ${ARG}

reload:
	-cd laradock; docker-compose exec workspace php artisan optimize
	-cd laradock; docker-compose exec workspace php artisan cache:clear
	-cd laradock; docker-compose exec workspace php artisan config:clear
	make dump

dump:
	cd laradock; docker-compose exec workspace composer dump-autoload ${ARG}

migrate:
	cd laradock; docker-compose exec workspace php artisan migrate ${ARG}

rollback:
	cd laradock; docker-compose exec workspace php artisan migrate:rollback

seed:
	cd laradock; docker-compose exec workspace php artisan db:seed ${ARG}

test:
	cd laradock; docker-compose exec workspace ./vendor/bin/php-cs-fixer fix
	cd laradock; docker-compose exec workspace ./vendor/bin/phpunit ${ARG}

fix:
	cd laradock; docker-compose exec workspace ./vendor/bin/php-cs-fixer fix ${ARG}

dev:
	cd laradock; docker-compose exec workspace npm run dev

watch:
	cd laradock; docker-compose exec workspace npm run watch

db:
	cd laradock; docker-compose exec mariadb mysql -uroot -proot sample

refresh:
	cd laradock; docker-compose exec workspace php artisan migrate:refresh
	cd laradock; docker-compose exec workspace php artisan db:seed --class TestDatabaseSeeder

repl:
	cd laradock; docker-compose exec workspace ./vendor/bin/psysh

link:
	cd laradock; docker-compose exec workspace php artisan storage:link

console:
	cd laradock; docker-compose exec ${ARG} bash

## Install
install:
	git submodule init
	git submodule update -i
	cp .env.laradock laradock/.env
	make start
	cp .env.example .env
	cd laradock; docker-compose exec workspace composer install
	cd laradock; docker-compose exec workspace npm install
	cd laradock; docker-compose exec workspace npm run dev
	cd laradock; docker-compose exec workspace php artisan key:generate

build:
	cd laradock; docker-compose build workspace nginx mariadb php-fpm
