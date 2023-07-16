# app/views.py
from rest_framework import generics, permissions

from .models import *
from .permissions import IsOwnerOrReadOnly
from .serializers import *


class CarlistAPIView(generics.ListAPIView):
    queryset = CarList.objects.all()
    serializer_class = CarListSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class CarlistUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = CarList.objects.all()
    serializer_class = CarListSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly,
                          IsOwnerOrReadOnly]


class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class UserDetail(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class CommentList(generics.ListCreateAPIView):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)

class CommentDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly,
                          IsOwnerOrReadOnly]

