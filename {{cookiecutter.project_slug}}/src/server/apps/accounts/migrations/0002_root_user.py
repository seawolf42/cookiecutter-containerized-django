from django.db import migrations


def create_root_user(apps, schema_editor):
    User = apps.get_model("accounts", "User")
    root = User.objects.create(
        id=1, username="root", email="root@nodomain.com", password="$", is_superuser=True, is_staff=True
    )
    root.save()


class Migration(migrations.Migration):

    dependencies = [
        ("accounts", "0001_initial"),
    ]

    operations = [
        migrations.RunPython(create_root_user),
    ]
