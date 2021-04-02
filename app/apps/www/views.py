from django.http import HttpResponse


def index(request):
    return HttpResponse("<h1>hello</h1>")


def healthz(request):
    return HttpResponse("ok")
