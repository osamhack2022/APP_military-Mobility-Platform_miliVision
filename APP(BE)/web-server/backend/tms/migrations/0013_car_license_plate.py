# Generated by Django 4.0 on 2022-10-10 13:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tms', '0012_remove_notification_reservation_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='car',
            name='license_plate',
            field=models.CharField(max_length=30, null=True),
        ),
    ]
