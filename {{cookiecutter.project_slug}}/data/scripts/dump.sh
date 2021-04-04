#!/bin/bash

IGNORE_TABLES="-T django_admin_log -T django_session"

pg_dump --schema-only hammer -h db -U hammer > /project/data/dumps/schema.sql
pg_dump --data-only hammer -h db -U hammer ${IGNORE_TABLES} > /project/data/dumps/base.sql
