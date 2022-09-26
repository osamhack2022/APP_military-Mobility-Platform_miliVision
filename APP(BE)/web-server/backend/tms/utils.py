from .models import Reservation, Notification, Car
from login.models import User
from .serializers import NotificationSerializer, ReservationSerializer

def get_user(user_id):
    try:
        return User.objects.get(id=user_id)
    except:
        return AnonymousUser()

def get_car(car_id):
    return Car.objects.get(id=car_id)

def get_notification():
    notifications = Notification.objects.all()
    serializer = NotificationSerializer(notifications, many=True)
    return serializer.data

def get_reservation(reservation_id):
    reservation = Reservation.objects.get(id=reservation_id)
    serializer = ReservationSerializer(reservation)
    return serializer.data

def get_reservation_by_user(user_id):
    reservation = Reservation.objects.filter(booker=user_id)
    serializer = ReservationSerializer(reservation, many=True)
    return serializer.data