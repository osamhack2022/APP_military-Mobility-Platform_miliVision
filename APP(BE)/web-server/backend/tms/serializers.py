from rest_framework import serializers
from .models import Notification, Reservation, Car

class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = ('type_of_notification', 'message', "battalion_receiver", "permission",)


class ReservationBookingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reservation
        fields = ('booker', 'car', 'departure', 'destination', 'followers_num', 'stopover', 'is_sharing', 'reservation_date', 'reason')

class ReservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reservation
        fields = '__all__'

class CarSerializer(serializers.ModelSerializer):
    class Meta:
        model = Car
        fields = '__all__'

class ReservationJoinCarSerializer(serializers.ModelSerializer):
    car_id = serializers.RelatedField(source='car', read_only=True)

    class Meta:
        model = Reservation
        fields = '__all__'

class AvailableCarSerializer(serializers.Serializer):
    battalion = serializers.CharField(max_length=10, default="0")
    departure = serializers.CharField(max_length=264,default="")
    destination = serializers.CharField(max_length=264,default="")
    followers_num = serializers.IntegerField(default=0)
    stopover = serializers.CharField(max_length=264,default="")