from django.urls import path
from . import views

urlpatterns = [
    path('', views.get, name='plans'),
    path('somePost', views.create, name='plans-create'),
    path('someGet/<int:pk>', views.read, name='plans-read'),
    path('somePut/<int:pk>', views.update, name='plans-update'),
    path('someDelete/<int:pk>', views.delete, name='plans-delete'),
]
