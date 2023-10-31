from rest_framework import serializers
from .models import PendingProduce


class PendingProduceSerializer(serializers.ModelSerializer):
    class Meta:
        model = PendingProduce
        fields = '__all__'
