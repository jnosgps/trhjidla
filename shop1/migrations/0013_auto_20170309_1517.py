# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-03-09 14:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop1', '0012_pageinfo'),
    ]

    operations = [
        migrations.AddField(
            model_name='pageinfo',
            name='image1',
            field=models.ImageField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='image2',
            field=models.ImageField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='image3',
            field=models.ImageField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='image4',
            field=models.ImageField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='image5',
            field=models.ImageField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='image6',
            field=models.ImageField(blank=True, null=True, upload_to=b'img/impressum'),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='impressum1',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='impressum2',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='impressum3',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='impressum4',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='impressum5',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='pageinfo',
            name='impressum6',
            field=models.TextField(blank=True, null=True),
        ),
    ]
