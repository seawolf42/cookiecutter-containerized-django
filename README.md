# Django

This is a demonstration of how to set up and use a fully-containerized local development environment. This maximizes the similarity both when developing on machines with different configurations and between running locally and running in production.

## Requirements

### Accounts & Access

You will need accounts on the following platforms:

-   [Docker Hub](https://hub.docker.com/)

### Software

-   [Docker](https://www.docker.com/get-docker/)

**Windows** users will also need the `make` command, which is believed to work by installing Chcolately:

-   [Chocolatey](https://chocolatey.org/install)

## Initial Setup and Execution

```bash
make build
make serve
```

> API is available at <http://localhost:8000>.

## Subsequent Execution

```bash
make serve
```

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
```

> API is available at <http://localhost:8001>

## Local Development

(TBD)

## Test

## Deploy
