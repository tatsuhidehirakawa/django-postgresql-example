from rest_framework import serializers
from .models import AccountMaster


class ObtainTokenSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = AccountMaster
        fields = ['account_id', 'account_name', 'mail_address', 'zip_code', 'barth_date', 'time_zone', 'language', 'registration_date']
