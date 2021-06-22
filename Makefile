.PHONY: build

CURRENT_UID ?= $(shell id -u)
CURRENT_GID ?= $(shell id -g)
DOCKER_CMD=CURRENT_UID=$(CURRENT_UID) CURRENT_GID=$(CURRENT_GID) docker-compose

# Rebuild docker images if changes detected
var/log/.docker-build: docker-compose.yml $(shell find docker -type f)
	@$(DOCKER_CMD) build
	@mkdir -p var/log
	@touch var/log/.docker-build

build: var/log/.docker-build

up: var/log/.docker-build
	@$(DOCKER_CMD) up

stop: var/log/.docker-build
	@$(DOCKER_CMD) down --remove-orphan
