from django.http import HttpResponse


def index(request):
    return HttpResponse(
        "<h1>hello</h1><p>Links:<ul><li><a href='/admin'>admin</a></li></ul></p>"
    )


def healthz(request):
    return HttpResponse("ok")
