from django.contrib import admin
from django.urls import path, include
from product.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('product.urls')),
]
