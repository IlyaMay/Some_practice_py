from django.urls import path, include
from .views import *

urlpatterns = [
    path('product/', ProductAPIView.as_view()),
    path('product/<int:pk>/', ProductAPIUpdate.as_view()),
    path('product/delete/<int:pk>/', ProductAPIDestroy.as_view()),
]

