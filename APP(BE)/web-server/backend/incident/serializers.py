from rest_framework import serializers
from .models import Incident, Rescue

class IncidentSerializer(serializers.ModelSerializer):
    image = serializers.ImageField(use_url=True)

    class Meta:
        model = Incident
        fields = ['car', 'incident_type', 'location', 'image']

class RescueSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rescue
        fields = ['car', 'location', 'service_needs', 'note']