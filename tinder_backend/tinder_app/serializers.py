from rest_framework import serializers
from.models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('img', 'name', 'age', 'likes',
                  'active', 'online', 'story', 'is_leo', 'is_liked')


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ('img', 'name', 'online', 'story', 'message', 'created_at')


class IconSerializer(serializers.ModelSerializer):
    class Meta:
        model = Icon
        fields = ('icon', 'size', 'icon_size')
