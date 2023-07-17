from django.urls import path, include
from rest_framework import routers
from .views import UserViewSet

# APIを一気に作成
# GET /users  全件読み取り
# POST /users  作成
# GET /users/<int:pk>  読み取り
# PUT /users/<int:pk>  更新
# PATCH /users/<int:pk>  一部更新
# DELETE /users/<int:pk>  削除

router = routers.DefaultRouter()
router.register('users', UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
