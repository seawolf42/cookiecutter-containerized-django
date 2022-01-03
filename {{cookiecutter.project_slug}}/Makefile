export PROJECT ?= {{ cookiecutter.project_slug }}

DOCKER ?= docker
DOCKER_COMPOSE ?= docker-compose -f ${PWD}/tools/docker/docker-compose.yml -f ${PWD}/tools/docker/docker-compose-devops.yml

RUN = ${DOCKER_COMPOSE} run --rm

.PHONY: server.%
server.%:
	${RUN} -w /project/src/server shell make ${*}

.PHONY: start
start: serve

.PHONY: stop
stop:
	${DOCKER_COMPOSE} stop

.PHONY: serve
serve: serve.server

.PHONY: serve.%
serve.%:
	${DOCKER_COMPOSE} up --remove-orphans ${*}

.PHONY: sighup.%
sighup.%:
	${DOCKER_COMPOSE} kill -s SIGHUP ${*}

.PHONY: run.%
run.%:
	${RUN} ${*}

.PHONY: run.db-cli
run.db-cli:
	${RUN} db-shell psql -h db -U {{ cookiecutter.project_slug }}

.PHONY: run.shell
run.shell:
	${RUN} shell bash

.PHONY: shell
shell: run.shell

.PHONY: build
build:
	${DOCKER_COMPOSE} build

.PHONY: test
test: src.test

.PHONY: data.%
data.%: export DOCKER_RUN ?= ${RUN}
data.%:
	${MAKE} -C data ${*}

.PHONY: src.%
src.%:
	${RUN} -w /project/src shell make ${*}

.PHONY: tools.%
tools.%: export DOCKER_RUN ?= ${RUN}
tools.%:
	${MAKE} -C tools ${*}

.PHONY: cleanup
cleanup: stop
	${DOCKER_COMPOSE} down
	${DOCKER} volume rm $$(${DOCKER} volume ls -q -f dangling=true)
