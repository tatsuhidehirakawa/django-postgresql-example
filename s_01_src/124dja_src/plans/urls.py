from django.urls import path
from . import views

urlpatterns = [
    path('', views.get, name='plans'),
    path('somePost', views.create, name='plans-create'),
    path('someGet/<str:pk>', views.read, name='plans-read'),
    path('somePut/<str:pk>', views.update, name='plans-update'),
    path('someDelete/<str:pk>', views.delete, name='plans-delete'),
]
