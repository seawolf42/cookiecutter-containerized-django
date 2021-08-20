#!/bin/sh

dropdb {{ cookiecutter.project_slug }} --if-exists -h db -U {{ cookiecutter.project_slug }}
createdb {{ cookiecutter.project_slug }} -h db -U {{ cookiecutter.project_slug }}

psql -v ON_ERROR_STOP=1 -h db -U {{ cookiecutter.project_slug }} < /project/data/dumps/schema.sql
psql -v ON_ERROR_STOP=1 -v ON_ERROR_STOP=1 -h db -U {{ cookiecutter.project_slug }} < /project/data/dumps/base.sql
