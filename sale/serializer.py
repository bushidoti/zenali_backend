from rest_framework import serializers
from .models import SaleFactor


class SaleFactorSerializer(serializers.ModelSerializer):
    class Meta:
        model = SaleFactor
        fields = '__all__'

