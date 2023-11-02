from django_jalali.serializers.serializerfield import JDateField
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


class RawMaterialSerializer(serializers.ModelSerializer):
    class Meta:
        model = RawMaterial
        fields = '__all__'


class ConsumingMaterialSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConsumingMaterial
        fields = '__all__'


class ProductionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Production
        fields = '__all__'


class ProductionCheckSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductionCheck
        fields = '__all__'


class RawMaterialFactorSerializer(serializers.ModelSerializer):
    class Meta:
        model = RawMaterialFactor
        fields = '__all__'


class RawMaterialCheckSerializer(serializers.ModelSerializer):
    class Meta:
        model = RawMaterialCheck
        fields = '__all__'


class RawMaterialDetailedSerializer(DynamicFieldsModelSerializer, serializers.ModelSerializer):
    class Meta:
        model = RawMaterialDetailed
        fields = '__all__'
        extra_fields = ['name']

    def get_field_names(self, declared_fields, info):
        expanded_fields = super(RawMaterialDetailedSerializer, self).get_field_names(
            declared_fields, info)

        if getattr(self.Meta, 'extra_fields', None):
            return expanded_fields + self.Meta.extra_fields
        else:
            return expanded_fields


class ConsumingMaterialFactorSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConsumingMaterialFactor
        fields = '__all__'


class ConsumingMaterialCheckSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConsumingMaterialCheck
        fields = '__all__'


class ConsumingMaterialDetailedSerializer(DynamicFieldsModelSerializer, serializers.ModelSerializer):
    class Meta:
        model = ConsumingMaterialDetailed
        fields = '__all__'
        extra_fields = ['name']

    def get_field_names(self, declared_fields, info):
        expanded_fields = super(ConsumingMaterialDetailedSerializer, self).get_field_names(
            declared_fields, info)

        if getattr(self.Meta, 'extra_fields', None):
            return expanded_fields + self.Meta.extra_fields
        else:
            return expanded_fields


class RequestSupplySerializer(serializers.ModelSerializer):
    class Meta:
        model = RequestSupply
        fields = '__all__'


class WasteCheckSerializer(serializers.ModelSerializer):
    class Meta:
        model = WasteCheck
        fields = '__all__'


class WasteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Waste
        fields = '__all__'
