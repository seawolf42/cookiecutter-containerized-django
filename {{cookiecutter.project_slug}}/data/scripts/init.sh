#!/bin/sh

psql -U hammer < /project/data/dumps/schema.sql
psql -U hammer < /project/data/dumps/base.sql
