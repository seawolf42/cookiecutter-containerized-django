#!/bin/sh

git init
git add .
git add -f .vscode/settings.json
git commit -m 'created from cookiecutter-containerized-django'
