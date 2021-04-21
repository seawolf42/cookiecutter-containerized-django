PROJECT ?= {{ cookiecutter.project_slug }}

DOCKER ?= docker
DOCKER_COMPOSE ?= docker-compose

RUN = ${DOCKER_COMPOSE} run --rm

.PHONY: start
start: serve

.PHONY: stop
stop:
	${DOCKER_COMPOSE} stop

.PHONY: serve
serve: serve.app

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
	${RUN} --entrypoint "psql -h db -U {{ cookiecutter.project_slug }}" db-shell

.PHONY: run.app-shell
run.app-shell:
	${RUN} --entrypoint bash app

.PHONY: build
build:
	${DOCKER_COMPOSE} build

.PHONY: test
test:
	@echo not implemented...

.PHONY: app.%
app.%:
	${RUN} -w /project/app --entrypoint "make ${*}" app-shell

.PHONY: data.%
data.%: export DOCKER_RUN ?= ${RUN}
data.%:
	${MAKE} -C data ${*}

.PHONY: tools.%
tools.%: export DOCKER_RUN ?= ${RUN}
tools.%:
	${MAKE} -C tools ${*}
