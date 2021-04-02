PROJECT ?= hammer

DOCKER ?= docker
DOCKER_COMPOSE ?= docker-compose


.PHONY: start
.PHONY: stop
.PHONY: serve
.PHONY: serve.%
.PHONY: sighup.%
.PHONY: run.%
.PHONY: build
.PHONY: test
.PHONY: data.%
