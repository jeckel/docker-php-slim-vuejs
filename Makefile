# Rebuild docker images if changes detected
var/log/.docker-build: docker-compose.yml $(shell find docker -type f)
	@$(DOCKER_CMD) build
	@mkdir -p var/log
	@touch var/log/.docker-build
