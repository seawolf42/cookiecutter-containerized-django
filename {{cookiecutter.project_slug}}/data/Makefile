RUN ?= ${DOCKER_RUN}

.PHONY: dump
dump: SCRIPT = data/scripts/dump.sh
dump: script

.PHONY: reset
reset: SCRIPT = ./data/scripts/reset.sh
reset: script

.PHONY: script
script:
	${RUN} --entrypoint "bash ${SCRIPT}" db-shell
