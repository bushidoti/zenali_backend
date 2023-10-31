from rest_framework import serializers
from .models import Sale, SaleFactor,AutoIncrementSaleFactor


class SaleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sale
        fields = '__all__'


class SaleFactorSerializer(serializers.ModelSerializer):
    class Meta:
        model = SaleFactor
        fields = '__all__'


class AutoIncrementSaleFactorSerializer(serializers.ModelSerializer):
    class Meta:
        model = AutoIncrementSaleFactor
        fields = '__all__'
