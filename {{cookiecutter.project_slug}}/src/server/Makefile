PYTHON ?= python

MANAGE ?= ${PYTHON} manage.py
PYTEST ?= ${PYTHON} -m pytest

.PHONY: serve
serve:
	${MANAGE} runserver 0.0.0.0:8000

.PHONY: serve.safe
serve.safe: static.build
	uwsgi

.PHONY: test
test:
	${PYTEST}

.PHONY: shell
shell:
	${MANAGE} shell

.PHONY: migrate.build
migrate.build:
	${MANAGE} makemigrations

.PHONY: migrate.exec
migrate.exec:
	${MANAGE} migrate
	@echo ALSO REMEMBER TO DUMP SCHEMA IN FIXTURES

.PHONY: static.build
static.build:
	${MANAGE} collectstatic --no-input
