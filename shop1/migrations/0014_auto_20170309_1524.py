# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-03-09 14:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop1', '0013_auto_20170309_1517'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pageinfo',
            name='image1',
            field=models.FileField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AlterField(
            model_name='pageinfo',
            name='image2',
            field=models.FileField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AlterField(
            model_name='pageinfo',
            name='image3',
            field=models.FileField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AlterField(
            model_name='pageinfo',
            name='image4',
            field=models.FileField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AlterField(
            model_name='pageinfo',
            name='image5',
            field=models.FileField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AlterField(
            model_name='pageinfo',
            name='image6',
            field=models.FileField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
    ]