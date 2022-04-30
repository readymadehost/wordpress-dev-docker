# Wordpress dev docker

A development docker for every wordpress project


## Features

- Build for wordpress and has cli tools
- Bundle of `fpm`, `cli`, `nginx`, `mariadb`, `phpmyadmin` and `redis` containers
- PHP 5.5, 5.6, 7.0, 7.1, 7.2, 7.3, 7.4, 8.0 and 8.1 supported
- Database mariadb 10.x, mongodb 4.x ... supported
- Node 14.x, 16.x, 17.x, ... supported
- Included wp, composer and node cli
- Support for PhpStorm or VSCode + WSL2/docker-desktop setup
- Support for xdebug included check `.env` file


## Docker setup

- `git clone https://github.com/readymadehost/wordpress-dev-docker.git project-docker`
- `cd project-docker`
- `mkdir project` or `git clone <some_git_repo_url> project` for existing project
- `cp .env.sample .env` and review `.env` file
- `docker-compose build`
- `docker-compose up -d`
- `docker-compose exec cli bash`
- `wp --allow-root config list` for config list


## New wordpress project install

- Download zip from offical website and add code inside project dir
- Follow gui wordpress install


## Notes

- Project URL: http://{localhost/any_valid_host}:8080/
- PhpMyAdmin URL: http://{localhost/any_valid_host}:8180/
- For more info and change, check `.env` and `docker-compose.yml`
- Manage permission inside container using bash alias `mpp` or `/root/manage-project-permission.sh`
- Mariadb default:- host: `mariadb` user: `root`, password: `root`, database_name: `project`

```text
- <docker_root_dir> <-- docker root dir
- <docker_root_dir>/data <-- all docker data persist
- <docker_root_dir>/nginx <-- nginx
- <docker_root_dir>/php* <-- php cli and fpm containers
- <docker_root_dir>/.env <-- docker environment configuration

- <docker_root_dir>/project <-- project root dir

- <docker_root_dir>/project* <-- added in .gitignore
- <docker_root_dir>/*.sql <-- added in .gitignore
```


## Phpstorm

Simply add remote docker php cli interpreter, change path mapping and configure remote interpreter everywhere.


## Remote container extension + vscode

With vscode's remote container extension, we can simply connect into cli container.


## Pre build docker image

- `readymadehost/wordpress-dev-docker-php{PHP_VERSION}-cli:latest`
- `readymadehost/wordpress-dev-docker-php{PHP_VERSION}-fpm:latest`


## Quick Link

* Easy installation of PHP extensions in official PHP Docker images
    - https://github.com/mlocati/docker-php-extension-installer

* MailCatcher
    - https://github.com/sj26/mailcatcher

* ReadyMadeHost docker hub
    - https://hub.docker.com/orgs/readymadehost
