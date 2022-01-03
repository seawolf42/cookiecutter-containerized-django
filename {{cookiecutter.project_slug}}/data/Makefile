RUN ?= ${DOCKER_RUN}

.PHONY: dump
dump: SCRIPT = ./scripts/dump.sh
dump: script

.PHONY: reset
reset: SCRIPT = ./scripts/reset.sh
reset: script

.PHONY: script
script:
	cd .. && ${RUN} db-shell bash ${SCRIPT}
