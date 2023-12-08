from rest_framework import serializers
from .models import *


class DynamicFieldsModelSerializer(serializers.ModelSerializer):
    def __init__(self, *args, **kwargs):
        # Instantiate the superclass normally
        super(DynamicFieldsModelSerializer, self).__init__(*args, **kwargs)

        fields = self.context['request'].query_params.get('fields')
        if fields:
            fields = fields.split(',')
            # Drop any fields that are not specified in the `fields` argument.
            allowed = set(fields)
            existing = set(self.fields.keys())
            for field_name in existing - allowed:
                self.fields.pop(field_name)


class FactorPropertySerializer(DynamicFieldsModelSerializer, serializers.ModelSerializer):
    class Meta:
        model = FactorProperty
        fields = '__all__'


class PropertySerializer(DynamicFieldsModelSerializer, serializers.ModelSerializer):
    class Meta:
        model = Property
        fields = '__all__'


class RepairedPropertySerializer(DynamicFieldsModelSerializer, serializers.ModelSerializer):
    class Meta:
        model = RepairedProperty
        fields = '__all__'
