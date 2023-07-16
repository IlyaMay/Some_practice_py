from .views import *
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from . import views

urlpatterns = [
    path('users/', UserList.as_view()),
    path('users/<int:pk>/', UserDetail.as_view()),
    path('car/', CarlistAPIView.as_view()),
    path('car/<int:pk>/', CarlistUpdateDestroyAPIView.as_view()),
    path('car/delete/<int:pk>/', CarlistUpdateDestroyAPIView.as_view()),
    path('comments/', views.CommentList.as_view()),
    path('comments/<int:pk>/', views.CommentDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)