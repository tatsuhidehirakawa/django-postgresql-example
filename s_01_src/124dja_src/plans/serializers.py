from rest_framework import serializers
from .models import OfferListModel


class OfferListSerializer(serializers.ModelSerializer):
    class Meta:
        model = OfferListModel
        fields = ['offer_id','account_id', 'offer_type', 'offer_title', 'offer_severity', 'offer_catagory', 'offer_location', 'offer_status', 'offer_text']
