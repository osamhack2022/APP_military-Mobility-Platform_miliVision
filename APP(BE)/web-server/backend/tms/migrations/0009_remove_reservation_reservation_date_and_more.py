# Generated by Django 4.0 on 2022-10-03 13:24

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tms', '0008_rename_is_approved_reservation_status_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='reservation',
            name='reservation_date',
        ),
        migrations.AddField(
            model_name='reservation',
            name='reservation_end',
            field=models.DateTimeField(default=datetime.datetime.now, verbose_name='reservation end'),
        ),
        migrations.AddField(
            model_name='reservation',
            name='reservation_start',
            field=models.DateTimeField(default=datetime.datetime.now, verbose_name='reservation start'),
        ),
    ]