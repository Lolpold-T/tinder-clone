from rest_framework.views import APIView
from rest_framework.response import Response
from tinder_app.serializers import UserSerializer
from tinder_app.models import User


class UserView(APIView):
    def get(self, request, *args, **kwargs):
        query_set = User.objects.filter(is_leo=False)
        serializer = UserSerializer(query_set, many=True)
        return Response(serializer.data)

    def post(self, request, *args, **kwargs):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors)


class LeoView(APIView):
    def get(self, request, *args, **kwargs):
        query_set = User.objects.filter(is_leo=True)
        serializer = UserSerializer(query_set, many=True)
        return Response(serializer.data)

    def post(self, request, *args, **kwargs):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors)


class LikedLeoView(APIView):
    def get(self, request, *args, **kwargs):
        query_set = User.objects.filter(is_liked=True)
        serializer = UserSerializer(query_set, many=True)
        return Response(serializer.data)

    def post(self, request, *args, **kwargs):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors)
