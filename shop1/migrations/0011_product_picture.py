# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-17 14:43
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop1', '0010_auto_20170217_1508'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='picture',
            field=models.ImageField(blank=True, null=True, upload_to=b'img/products'),
        ),
    ]
