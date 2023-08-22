from rest_framework import serializers

from .models import Profile


class ProfileSerializer(serializers.ModelSerializer):
    def __init__(self, *args, **kwargs):
        remove_fields = kwargs.pop('remove_fields', None)
        super(ProfileSerializer, self).__init__(*args, **kwargs)

        if remove_fields:
            for field_name in remove_fields:
                self.fields.pop(field_name)

    account_name = serializers.CharField(source='account.account_name', required=False)

    class Meta:
        model = Profile
        fields = ['account_id', 'account_name', 'self_introduction', 'twitter_uri', 'facebook_uri', 'instagram_uri', 'skill', 'rate', 'status']


class ProfileListSerializer(serializers.ModelSerializer):
    account_name = serializers.CharField(source='account.account_name', required=False)

    class Meta:
        model = Profile
        fields = ('account_id', 'account_name', 'skill', 'rate', 'status')
