PYTHON ?= ${DOCKER_RUN} --entrypoint python --workdir /project/tools app-shell

VSCODE_SETTINGS_REVEAL = ${PYTHON} -m vscode_settings_reveal

.PHONY: editor.reveal
editor.reveal:
	${VSCODE_SETTINGS_REVEAL}

.PHONY: editor.conceal
editor.conceal:
	${VSCODE_SETTINGS_REVEAL} --conceal
