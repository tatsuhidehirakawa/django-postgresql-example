from django.urls import path

from . import views
from .views import ProfileSearch

urlpatterns = [
    path('edit', views.edit, name='profiles-edit'),
    path('<str:pk>', views.detail, name='profiles-detail'),
    path('search/list', ProfileSearch.as_view(), name='profiles-search'),
]
