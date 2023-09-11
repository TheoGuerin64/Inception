all: start

build:
		docker compose -f srcs/docker-compose.yml build

start:
		docker compose -f srcs/docker-compose.yml up -d

stop:
		docker compose -f srcs/docker-compose.yml down

clean: stop
		docker system prune -af
		docker volume rm srcs_wordpress srcs_database
		sudo rm -rf ~/data/wordpress/* ~/data/database/*

.PHONY: all, build, start, stop, clean

