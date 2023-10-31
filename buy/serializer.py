from rest_framework import serializers
from .models import ApplyBuy


class ApplyBuySerializer(serializers.ModelSerializer):
    class Meta:
        model = ApplyBuy
        fields = '__all__'
