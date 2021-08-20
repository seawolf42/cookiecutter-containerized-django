import os
import django
from django.conf import settings


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings.local")


def pytest_configure():
    settings.DEBUG = False
    settings.DATABASES["default"] = {"ENGINE": "django.db.backends.sqlite3"}
    django.setup()
