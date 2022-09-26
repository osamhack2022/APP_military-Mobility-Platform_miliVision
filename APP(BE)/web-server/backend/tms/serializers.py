from rest_framework import serializers
from .models import Notification, Reservation, Car

class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = ('type_of_notification', 'message', "battalion_receiver", "permission",)


class ReservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reservation
        fields = '__all__'

class CarSerializer(serializers.ModelSerializer):
    class Meta:
        model = Car
        fields = '__all__'

class AvailableCarSerializer(serializers.Serializer):
    battalion = serializers.CharField(max_length=10, default="0")
    departure = serializers.CharField(max_length=264,default="")
    destination = serializers.CharField(max_length=264,default="")
    followers_num = serializers.IntegerField(default=0)
    stopover = serializers.CharField(max_length=264,default="")