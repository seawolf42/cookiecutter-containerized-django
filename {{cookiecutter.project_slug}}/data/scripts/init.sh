#!/bin/sh

psql -U {{ cookiecutter.project_slug }} < /project/data/dumps/schema.sql
psql -U {{ cookiecutter.project_slug }} < /project/data/dumps/base.sql
