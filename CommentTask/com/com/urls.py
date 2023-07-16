from django.urls import path, include
from django.contrib import admin
from rest_framework.routers import DefaultRouter
from comAPI.views import PostViewSet, UserViewSet, CommentViewSet, CategoryViewSet
from .docs import urlpatterns as doc_url

router = DefaultRouter()
router.register(r'posts', PostViewSet)
router.register(r'user', UserViewSet)
router.register(r'category', CategoryViewSet)
router.register(r'comments', CommentViewSet)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),
    path('docs/', include(doc_url))
]
