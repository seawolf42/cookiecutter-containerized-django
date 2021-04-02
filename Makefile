PROJECT ?= hammer

DOCKER ?= docker
DOCKER_COMPOSE ?= docker-compose

BUILD ?= ${DOCKER_COMPOSE} build
SERVE ?= ${DOCKER_COMPOSE} up --remove-orphans
RUN ?= ${DOCKER_COMPOSE} run --rm
SIGHUP ?= ${DOCKER_COMPOSE} kill -s SIGHUP


.PHONY: start
start: serve

.PHONY: stop
stop:
	${DOCKER_COMPOSE} stop

.PHONY: serve
serve: serve.app

.PHONY: serve.%
serve.%:
	${SERVE} ${*}

.PHONY: sighup.%
sighup.%:
	${SIGHUP} ${*}

.PHONY: run.%
run.%:
	${RUN} ${*}

.PHONY: run.db-cli
run.db-cli:
	${RUN} --entrypoint "psql -h db -U hammer" db-shell

.PHONY: run.app-shell
run.app-shell:
	${RUN} --entrypoint bash app

.PHONY: build
build:
	${BUILD}

.PHONY: test
test:
	@echo not implemented...

.PHONY: data.%
data.%: export DOCKER_RUN ?= ${RUN}
data.%:
	${MAKE} -C data ${*}
