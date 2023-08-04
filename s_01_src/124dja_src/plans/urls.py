from django.urls import path
from . import views

urlpatterns = [
    path('', views.get, name='contracts'),
    path('somePost', views.create, name='contracts-create'),
    path('someGet/<str:pk>', views.read, name='contracts-read'),
    path('somePut/<str:pk>', views.update, name='contracts-update'),
    path('someDelete/<str:pk>', views.delete, name='contracts-delete'),
]
