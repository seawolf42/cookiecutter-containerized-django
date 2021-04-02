import pathlib

import environ

from django.core.exceptions import ImproperlyConfigured


# build paths like: BASE_DIR / 'subdir'.
BASE_DIR = pathlib.Path(__file__).resolve().parent.parent.parent

# environment for loading all settings
env = environ.Env()


#
# switches
#

IS_PRODUCTION = not env.bool("IS_LOCAL_ENVIRONMENT", default=False)
IS_LOCAL_MEDIA_ALLOWED = env("IS_LOCAL_MEDIA_ALLOWED", default=False) if IS_PRODUCTION else True


#
# all config beyond this point is identical across environments
#

# core

SECRET_KEY = env("SECRET_KEY")
DATABASE_URL = env.db()

DEBUG = False if IS_PRODUCTION else env.bool("DEBUG", False)
DEBUG_TOOLBAR = False if IS_PRODUCTION else DEBUG and env.bool("DEBUG_TOOLBAR", False)


# project settings

WSGI_APPLICATION = "config.wsgi.application"

DATABASES = dict(default=DATABASE_URL)

ALLOWED_HOSTS = ("*",)

ROOT_URLCONF = "config.urls"


# application

INSTALLED_APPS = (
    # overrides: apps that need to come first
    #   none
    # django
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    # local apps
    "apps.accounts",
    "apps.www",
    # third-party apps
    #   none
)

MIDDLEWARE = (
    "django.middleware.security.SecurityMiddleware",  # should be first
    "whitenoise.middleware.WhiteNoiseMiddleware",  # must go immediately after security
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
)

TEMPLATES = (
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": (BASE_DIR / "templates",),
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": (
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ),
        },
    },
)


# site

SITE_ID = 1


# authentication

AUTH_USER_MODEL = "accounts.User"

AUTH_PASSWORD_VALIDATORS = tuple(
    dict(NAME=name)
    for name in (
        "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
        "django.contrib.auth.password_validation.MinimumLengthValidator",
        "django.contrib.auth.password_validation.CommonPasswordValidator",
        "django.contrib.auth.password_validation.NumericPasswordValidator",
    )
)


# internationalization

LANGUAGE_CODE = "en-us"
TIME_ZONE = "UTC"
USE_I18N = True
USE_L10N = True
USE_TZ = True


# static files

STATIC_URL = "/static/"
STATIC_ROOT = BASE_DIR / "collected-static"
STATIC_URL = "/static/"
STATICFILES_DIRS = (BASE_DIR / "static",)
STATICFILES_FINDERS = (
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",
)
WHITENOISE_KEEP_ONLY_HASHED_FILES = True
STATICFILES_STORAGE = "whitenoise.storage.CompressedManifestStaticFilesStorage"


# media

MEDIA_URL = "/media/"

if not IS_LOCAL_MEDIA_ALLOWED:
    raise ImproperlyConfigured('media storage should be in a cloud bucket')
else:
    MEDIA_ROOT = BASE_DIR / "media"