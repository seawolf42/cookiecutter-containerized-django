from django.contrib import admin

from . import models


@admin.register(models.User)
class UserAdmin(admin.ModelAdmin):

    list_display = ("username", "email")

    readonly_fields = ("date_joined", "last_login")

    fieldsets = (
        (
            None,
            {"fields": ("username", "email")},
        ),
        (
            "Account Type",
            {
                "fields": (
                    "is_superuser",
                    "is_active",
                    "is_staff",
                    "date_joined",
                    "last_login",
                )
            },
        ),
    )
