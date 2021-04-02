#!/bin/sh

dropdb hammer --if-exists -h db -U hammer
createdb hammer -h db -U hammer

psql -h db -U hammer < /project/data/dumps/schema.sql
psql -h db -U hammer < /project/data/dumps/base.sql
