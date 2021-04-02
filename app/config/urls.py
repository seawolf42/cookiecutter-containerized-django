from django.contrib import admin
from django.conf import settings
from django.conf.urls import include
from django.conf.urls import url
from django.conf.urls.static import static
from django.urls import path


# primary url sections

urlpatterns = (path("admin/", admin.site.urls), path("", include("apps.www.urls")))


# debug

if settings.DEBUG:
    import debug_toolbar
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns

    toolbar_patterns = (url(r"^__debug__/", include(debug_toolbar.urls)),) if settings.DEBUG_TOOLBAR else ()
    media_patterns = tuple(static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT))
    static_patterns = tuple(staticfiles_urlpatterns())
    urlpatterns = toolbar_patterns + media_patterns + static_patterns + urlpatterns
