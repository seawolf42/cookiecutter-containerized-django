PYTHON ?= python
PIP_COMPILE ?= pip-compile --generate-hashes --allow-unsafe

MANAGE ?= ${PYTHON} manage.py
BLACK ?= ${PYTHON} -m black --line-length=120 --exclude='apps/migrations/*' .

.PHONY: serve
serve:
	${MANAGE} runserver 0.0.0.0:8000

.PHONY: serve.safe
serve.safe: static.build
	uwsgi

.PHONY: reqs
reqs:
	${PIP_COMPILE} -v requirements.in

.PHONY: migrate.exec
migrate.exec:
	${MANAGE} migrate

.PHONY: migrate.build
migrate.build:
	${MANAGE} makemigrations
	@echo ALSO REMEMBER TO DUMP SCHEMA IN FIXTURES

.PHONY: static.build
static.build:
	${MANAGE} collectstatic --no-input

.PHONY: beautify
beautify:
	${BLACK}
