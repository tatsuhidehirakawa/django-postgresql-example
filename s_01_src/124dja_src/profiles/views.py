from django.db.models import Q
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.generics import ListAPIView
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .models import Profile
from .serializers import ProfileSerializer, ProfileListSerializer


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def edit(request):
    current_user = request.user
    profile = Profile.objects.filter(account_id=current_user.account_id).first()
    if profile:
        data = ProfileSerializer(instance=profile, data=request.data, partial=True, remove_fields=['account_name', 'rate'])
        if data.is_valid():
            data.save()
            return Response(data.data)
        else:
            return Response(status=status.HTTP_404_NOT_FOUND, data={'error': data.errors})
    else:
        return Response(current_user)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def detail(request, pk):
    current_user = request.user
    if current_user.account_id == pk:
        return Response(status=status.HTTP_404_NOT_FOUND, data={'error': "access denied."})

    item = Profile.objects.get(pk=pk)
    if item:
        data = ProfileSerializer(item)
        return Response(data.data)

    return Response(status=status.HTTP_404_NOT_FOUND, data={'error': "profile not found"})


@api_view(['GET'])
def search(request):
    current_user = request.user
    if request.query_params:
        if request.query_params.get("self_introduction"):
            q = Q(self_introduction__contains=request.query_params.get("self_introduction"))
        else:
            q = Q(self_introduction__contains='')

        if request.query_params.get("skill"):
            q = q | Q(skill__contains=request.query_params.get("skill"))
        if request.query_params.get("rate"):
            q = q | Q(rate__gte=request.query_params.get("rate"))

        items = Profile.objects.filter(q & ~Q(account_id=current_user.account_id)).order_by('status', '-rate', 'account_id')
    else:
        items = Profile.objects.filter(~Q(account_id=current_user.account_id)).order_by('status', '-rate', 'account_id')

    serializer = ProfileSerializer(items, many=True, remove_fields=['twitter_uri', 'facebook_uri', 'instagram_uri', 'skill'])
    return Response(serializer.data)


class ProfileSearchPagination(PageNumberPagination):
    page_size = 24
    page_size_query_param = 'page_size'


class ProfileSearch(ListAPIView):
    permission_classes = [IsAuthenticated]
    pagination_class = ProfileSearchPagination
    serializer_class = ProfileListSerializer

    def get_queryset(self):
        current_user = self.request.user
        if self.request.query_params.get("self_introduction"):
            q = Q(self_introduction__contains=self.request.query_params.get("self_introduction"))
        else:
            q = Q(self_introduction__contains='')

        if self.request.query_params.get("skill"):
            q = q | Q(skill__contains=self.request.query_params.get("skill"))
        if self.request.query_params.get("rate"):
            q = q | Q(rate__gte=self.request.query_params.get("rate"))

        return Profile.objects.filter(q & ~Q(account_id=current_user.account_id)).order_by('status', '-rate', 'account_id')
