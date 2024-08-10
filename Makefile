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
bundle/install: up
	$(DOCKER_COMPOSE) exec ruby bash -c 'bundle install'
ruby/bash: up
	$(DOCKER_COMPOSE) exec ruby bash
ruby/rspec: up
	$(DOCKER_COMPOSE) exec ruby bash -c 'bundle exec rspec'
ruby/appraisal/generate: up
	$(DOCKER_COMPOSE) exec ruby bash -c 'bundle exec appraisal generate'
gem/release:
	@read -p "Enter OTP code: " otp_code; \
	gh workflow run release.yml -f rubygems-otp-code="$$otp_code"