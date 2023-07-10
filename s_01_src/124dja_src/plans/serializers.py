from rest_framework import serializers
from .models import OfferList


class OfferListSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = OfferList
        fields = ['account_id', 'offer_type', 'offer_title', 'offer_severity', 'offer_catagory', 'offer_location', 'offer_status', 'offer_text']
