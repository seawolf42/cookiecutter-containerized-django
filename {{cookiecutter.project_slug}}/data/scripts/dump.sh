#!/bin/bash

IGNORE_TABLES="-T django_admin_log -T django_admin_log_id_seq -T django_session"

pg_dump --schema-only {{ cookiecutter.project_slug }} -h db -U {{ cookiecutter.project_slug }} > dumps/schema.sql
pg_dump --data-only {{ cookiecutter.project_slug }} -h db -U {{ cookiecutter.project_slug }} ${IGNORE_TABLES} > dumps/base.sql
