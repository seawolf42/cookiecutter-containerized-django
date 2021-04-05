# Cookie Cutter Template for Django in a Containerized Development Environment

This [cookiecutter](https://cookiecutter.readthedocs.io/) creates a shell for a very opinionated project structure for developing applications or service.

## Opinions

The following opinions guide the decisions around structuring this project:

<dl>
<dt><strong>Minimize prerequisites</strong></dt>
<dd>developers shouldn't have to maintain local services (`postgres`, `nginx`, etc) and per-language environments in thier working directories</dd>
<dt><strong>Minimize time to first run</strong></dt>
<dd>starting the app for the first time should take as few steps as possible (1 should be enough!) and should be relatively quick (a few minutes at most)</dd>
<dt><strong>Minimize variations</strong></dt>
<dd>all environments should be the same, from production all the way down to throw-away environments used for local experimentation</dd>
<dt><strong>Minimize imperative config</strong></dt>
<dd>configuration should be declarative; this includes definitions for environments and services, run-time configuration, and tooling for building and deploying the app</dd>
</dl>

## Starter Project

The OOTB application is a fully-configured [Django](https://www.djangoproject.com/) application. This is meant predominantly to show how to configure all the services and tooling for a typical applicaton stack. The stack currently include Django and some common tooling for building with Django, a [Postgres](https://www.postgresql.org/) database, and tools like PSQL necessary for interaction with these services.

### Variations

A simple variation might be to add [Elasticsearch](https://www.elastic.co/what-is/elasticsearch) to the stack, while a more complicated variation might be to replace the database with [MongoDB](https://www.mongodb.com/) and the application with something written in Twisted; in either case,

Pull requests adding different starter projects to choose from are encouraged.
