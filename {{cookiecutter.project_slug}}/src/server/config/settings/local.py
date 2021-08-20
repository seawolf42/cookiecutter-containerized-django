from .base import *  # noqa F402

from .base import DEBUG_TOOLBAR
from .base import INSTALLED_APPS
from .base import MIDDLEWARE


# debug toolbar

if DEBUG_TOOLBAR:
    INSTALLED_APPS += ("debug_toolbar",)
    MIDDLEWARE = ("debug_toolbar.middleware.DebugToolbarMiddleware",) + MIDDLEWARE

DEBUG_TOOLBAR_CONFIG = dict(
    SHOW_TOOLBAR_CALLBACK=lambda x: DEBUG_TOOLBAR,  # noqa F405
)

INTERNAL_IPS = ("127.0.0.1",)
