from rest_framework import serializers
from .models import *


class DynamicFieldsModelSerializer(serializers.ModelSerializer):
    def __init__(self, *args, **kwargs):
        super(DynamicFieldsModelSerializer, self).__init__(*args, **kwargs)

        fields = self.context['request'].query_params.get('fields')
        if fields:
            fields = fields.split(',')
            allowed = set(fields)
            existing = set(self.fields.keys())
            for field_name in existing - allowed:
                self.fields.pop(field_name)


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'


class ProductDetailedSerializer(DynamicFieldsModelSerializer, serializers.ModelSerializer):
    class Meta:
        model = ProductDetailed
        fields = '__all__'
        extra_fields = ['name']

    def get_field_names(self, declared_fields, info):
        expanded_fields = super(ProductDetailedSerializer, self).get_field_names(
            declared_fields, info)

        if getattr(self.Meta, 'extra_fields', None):
            return expanded_fields + self.Meta.extra_fields
        else:
            return expanded_fields


class ConsumableSerializer(serializers.ModelSerializer):
    class Meta:
        model = Consumable
        fields = ['value']


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['value']


class ProductFactorSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductFactor
        fields = '__all__'


class ProductCheckSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductCheck
        fields = '__all__'

