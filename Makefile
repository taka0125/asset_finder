DOCKER_COMPOSE = docker compose

build:
	$(DOCKER_COMPOSE) build
up:
	$(DOCKER_COMPOSE) up -d
down:
	$(DOCKER_COMPOSE) stop
restart:
	$(MAKE) down
	$(MAKE) up
ps:
	$(DOCKER_COMPOSE) ps
convert:
	$(DOCKER_COMPOSE) convert
setup: up
	$(DOCKER_COMPOSE) exec ruby bash -c 'bin/setup'
ruby/bash:
	$(DOCKER_COMPOSE) exec ruby bash
ruby/rspec: up
	$(DOCKER_COMPOSE) exec ruby bash -c 'bundle exec rspec'
