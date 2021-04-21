# {{ cookiecutter.project_name }}

This is a demonstration of how to set up and use a fully-containerized local development environment. This maximizes the similarity both when developing on machines with different configurations and between running locally and running in production.

## Requirements

### Accounts & Access

You will need accounts on the following platforms:

-   [Github](https://github.com/)
-   [Google Cloud Platform](https://console.cloud.google.com/)
-   [Docker Hub](https://hub.docker.com/)

### Software

-   [Docker](https://www.docker.com/get-docker/)

**Windows** users will also need the `make` command, which is believed to work by installing Chcolately:

-   [Chocolatey](https://chocolatey.org/install)

## Initial Setup and Bootstrapping (First Run on First Developer's System)

Before the project can fully build, prerequisites need to be determined:

```bash
make build
make app.reqs
```

Continue to the **First Run on New System** steps below.

## First Run on New System

Build the full stack and start it:

```bash
make build serve
# press `ctrl-c` to exit
```

> app URL: <http://localhost:8000>

**Note**: due to a race condition, the databaswe might not be ready fast enough for the app container on the very first run (the database needs to run initial setup scripts that take several seconds). If you receive an error when loading the site, simply press `ctrl-c` and then `make serve` to re-start it.

## Subsequent Execution

```bash
make serve
# press `ctrl-c` to exit
```

> app URL: <http://localhost:8001>

## Pausing/Suspending Development

You can stop the project fully and re-start it again at a future time. To stop all containers and free ports:

```bash
make stop
```

This takes down any containers but leaves volumes (for database state and user uploads locally) intact. Note that services may start or stop automatically as you work on things and they are needed, so simply exiting the `make serve` process with `ctrl-c` may not suspend everything.

## Logging In

The following accounts exist and can be logged in with username/password:

| username | password |
| -------- | -------- |
| root     | (none)   |
| dev      | `dev`    |
| alice    | `alice`  |
| bob      | `bob`    |

## WSGI App

The app can also be run in WSGI mode; this configuration can be started by running the `app-wsgi` container:

```bash
make serve.app-wsgi
# press `ctrl-c` to exit
```

> app URL: <http://localhost:8001>

## Local Development

(TBD)

## Test

(TBD)

## Deploy

(TBD)

## Tear-Down

The application can be completely removed by performing the following steps:

```bash
docker-compose down
docker volume rm $(docker volume ls -q -f dangling=true)
```

You may also need to remove images from Docker; look for images starting with `{{ cookiecutter.project_slug }}-` as well as the `postgres` container(s) used recently.
