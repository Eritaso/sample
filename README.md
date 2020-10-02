# initial setting

```bash
git clone https://github.com/Eritaso/sample-laravel.git
cd sample
```
# Commands
makeコマンドでいろいろできます。
```bash
# dockerを立ち上げます
make start 

# dockerを停止します
make stop 

# composer dump-autoloadを実行します
make dump 

# php artisan optimize, cache:clear, config:clear, dump auto-loadを実行します
make reload

# exec workspace ワークスペースでコマンドを実行(引数必須)
make run # not work
make run ARG="php artisan --version" 

# ./vendor/bin/phpunit テストを実行
make test
make test ARG="tests/Unit/ExampleTest" 

# ./vendor/bin/php-cs-fixer フォーマッタを実行
make fix
make fix ARG="--dry-run" 

# php artisan migrate DBのマイグレートを実行
make migrate
make migrate ARG="--refresh"

# php artisan db:seed DBのシーダーを実行
make seed
make seed ARG="--class DatabaseSeeder"

# npm run devを実行
make dev

# npm run watchを実行
make watch

# mariadbへ接続
make db

# テストデータを全て削除して、seedデータを入れ直す
make refresh
```

http://localhost:9999/
