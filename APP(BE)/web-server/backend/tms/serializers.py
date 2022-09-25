from rest_framework import serializers
from .models import Notification, Reservation

class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = ('type_of_notification', 'message')


class ReservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reservation
        fields = '__all__'