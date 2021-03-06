# Generated by Django 3.2.9 on 2021-11-28 08:10

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Chat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.CharField(max_length=500)),
                ('name', models.CharField(max_length=100)),
                ('online', models.BooleanField()),
                ('story', models.BooleanField()),
            ],
        ),
        migrations.CreateModel(
            name='Icon',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('icon', models.CharField(max_length=500)),
                ('size', models.IntegerField()),
                ('icon_size', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Like',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.CharField(max_length=500)),
                ('active', models.BooleanField()),
            ],
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.CharField(max_length=500)),
                ('name', models.CharField(max_length=100)),
                ('online', models.BooleanField()),
                ('story', models.BooleanField()),
                ('message', models.CharField(max_length=500)),
                ('created_at', models.DateTimeField()),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.CharField(max_length=500)),
                ('name', models.CharField(max_length=100)),
                ('age', models.CharField(max_length=50)),
                ('likes', models.CharField(max_length=1000)),
            ],
        ),
    ]
