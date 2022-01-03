PYTHON ?= ${DOCKER_RUN} --workdir /project/tools shell python

VSCODE_SETTINGS_REVEAL = ${PYTHON} -m vscode_settings_reveal

.PHONY: editor.reveal
editor.reveal:
	${VSCODE_SETTINGS_REVEAL}

.PHONY: editor.conceal
editor.conceal:
	${VSCODE_SETTINGS_REVEAL} --conceal
