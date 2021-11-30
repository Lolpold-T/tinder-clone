from django.db import models


class User(models.Model):
    img = models.CharField(max_length=500)
    name = models.CharField(max_length=100)
    age = models.CharField(max_length=50)
    likes = models.CharField(max_length=500)
    active = models.BooleanField(default=False)
    online = models.BooleanField(default=False)
    story = models.BooleanField(default=False)
    is_leo = models.BooleanField(default=True)
    is_liked = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class Message(models.Model):
    img = models.CharField(max_length=500)
    name = models.CharField(max_length=100)
    online = models.BooleanField()
    story = models.BooleanField()
    message = models.CharField(max_length=500)
    created_at = models.DateTimeField()

    def __str__(self):
        return self.name


class Icon(models.Model):
    icon = models.CharField(max_length=500)
    size = models.IntegerField()
    icon_size = models.IntegerField()
