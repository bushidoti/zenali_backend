from rest_framework import serializers
from .models import SaleFactor, AutoIncrementSaleFactor


class SaleFactorSerializer(serializers.ModelSerializer):
    class Meta:
        model = SaleFactor
        fields = '__all__'


class AutoIncrementSaleFactorSerializer(serializers.ModelSerializer):
    class Meta:
        model = AutoIncrementSaleFactor
        fields = '__all__'
