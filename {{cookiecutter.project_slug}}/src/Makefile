PYTHON ?= python

PIP_COMPILE ?= pip-compile --allow-unsafe
BLACK ?= ${PYTHON} -m black --line-length=120 --exclude='server/apps/.*/migrations/*' .
FLAKE8 ?= ${PYTHON} -m flake8
PYTEST ?= ${PYTHON} -m pytest

subsystems := server

.PHONY: reqs
reqs:
	${PIP_COMPILE} -v requirements/requirements.in

.PHONY: beautify
beautify:
	${BLACK}

.PHONY: lint
lint:
	${FLAKE8}

.PHONY: test
test: $(patsubst %,test.%,${subsystems})

.PHONY: test.%
test.%:
	${MAKE} -C ${*} test

.PHONY: test.server
test.server:
	cd server && ${PYTEST}
