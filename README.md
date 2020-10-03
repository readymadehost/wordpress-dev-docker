# Wordpress dev docker

A development docker for every wordpress project


## Features

- Build for wordpress and has cli tools
- Bundle of `fpm`, `cli`, `nginx`, `mariadb` and `phpmyadmin` containers
- Latest php7.4 and multiple version coming soon..
- Included wp, composer and node cli
- Support for PhpStorm or VSCode + WSL2/docker-desktop setup
- Prebuild docker images coming soon..


## Docker setup

- `git clone https://github.com/readymadehost/wordpress-dev-docker.git project-docker`
- `cd project-docker`
- `mkdir project` or `git clone <some_git_repo_url> project` for existing project
- `docker-compose up -d`
- `docker-compose exec cli bash`


## New wordpress project install

- `docker-compose exec cli /root/setup-new-project.sh` from outside container
- or `/root/setup-new-project.sh` from inside container
- Follow the regular web wordpress install steps via project url


## Notes

- Project URL: http://{localhost/any_valid_host}:8080/
- PhpMyAdmin URL: http://{localhost/any_valid_host}:8180/
- For more info and change, check `docker-compose.yml`
- Manage permission inside container using bash alias `mpp` or `/root/manage-project-permission.sh`
- Mariadb default:- host: `mariadb` user: `root`, password: `root`, database_name: `project`

```text
- <docker_root_dir> <-- docker root dir
- <docker_root_dir>/data <-- all docker data persist
- <docker_root_dir>/nginx <-- nginx
- <docker_root_dir>/php* <-- php cli and fpm containers
- <docker_root_dir>/project <-- project root dir
- <docker_root_dir>/project* <-- added in .gitignore
- <docker_root_dir>/*.sql <-- added in .gitignore
```


## Phpstorm

Simply add remote docker php cli interpreter, change path mapping and configure remote interpreter everywhere.


## Container + vscode

With vscode's remote container extension, we can simply connect into cli container.


## For production usages

- Planning for ready made host. Coming soon...