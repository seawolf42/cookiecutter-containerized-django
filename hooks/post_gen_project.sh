#!/bin/sh

rm -f tools/devops/db/initdb.d/init.sh
ln -s /project/data/scripts/init.sh tools/devops/db/initdb.d/init.sh
git init
git add .
git add -f .vscode/settings.json
git commit -m 'created from cookiecutter-containerized-django'
