from rest_framework import viewsets
from rest_framework import serializers
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import OfferListSerializer
from .models import OfferListModel
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes

def get_object(pk):
    try:
        return OfferListModel.objects.get(pk=pk)
    except:
        return None


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get(request):
    if request.query_params:
        items = OfferListModel.objects.filter(**request.query_params.dict())
    else:
        items = OfferListModel.objects.all()

    if items:
        serializer = OfferListSerializer(items, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND, data={'error': "page not found"})


@api_view(['POST'])
def create(request):
    item = OfferListSerializer(data=request.data)
    if item.is_valid():
        item.save()
        return Response(item.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND, data={'error': item.errors})


@api_view(['GET'])
def read(request, pk):
    item = get_object(pk=pk)
    if item:
        data = OfferListSerializer(item)
        if data:
            return Response(data.data)

    return Response(status=status.HTTP_404_NOT_FOUND, data={'error': "page not found"})


@api_view(['PUT'])
def update(request, pk):
    item = get_object(pk=pk)
    data = OfferListSerializer(instance=item, data=request.data)

    if data.is_valid():
        data.save()
        return Response(data.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND, data={'error': data.errors})


@api_view(['GET', 'DELETE'])
def delete(request, pk):
    item = get_object(pk=pk)
    if item:
        item.delete()
    return Response(status=status.HTTP_202_ACCEPTED, data={'status': "successful deleted"})
