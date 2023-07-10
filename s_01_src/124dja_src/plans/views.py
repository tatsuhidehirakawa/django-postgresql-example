from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from rest_framework import permissions
from .serializers import OfferListSerializer
from .models import OfferList


class PlansViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = OfferList.objects.all().order_by('create_date')
    serializer_class = OfferListSerializer
