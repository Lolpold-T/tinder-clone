# Generated by Django 3.2.9 on 2021-11-28 11:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tinder_app', '0002_auto_20211128_1332'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='likes',
            field=models.CharField(default='', max_length=500),
            preserve_default=False,
        ),
    ]