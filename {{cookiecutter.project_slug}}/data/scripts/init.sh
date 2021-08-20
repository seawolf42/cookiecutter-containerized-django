#!/bin/sh

psql -v ON_ERROR_STOP=1 -U {{ cookiecutter.project_slug }} < /project/data/dumps/schema.sql
psql -v ON_ERROR_STOP=1 -U {{ cookiecutter.project_slug }} < /project/data/dumps/base.sql
