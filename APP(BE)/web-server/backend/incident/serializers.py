from rest_framework import serializers
from .models import Incident

class IncidentSerializer(serializers.HyperlinkedModelSerializer):
    image = serializers.ImageField(use_url=True)

    class Meta:
        model = Incident
        fields = ['car', 'incident_type', 'location', 'image']