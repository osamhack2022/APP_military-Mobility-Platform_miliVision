from .models import Reservation, Notification, Car
from login.models import User
from .serializers import NotificationSerializer, ReservationSerializer, CarSerializer
from django.db.models import Q
from datetime import datetime

def get_user(user_id):
    try:
        return User.objects.get(id=user_id)
    except:
        return AnonymousUser()

def get_car(car_id):
    car = Car.objects.get(id=car_id)
    serializer = CarSerializer(car)
    return serializer.data

def get_notification():
    notifications = Notification.objects.all()
    serializer = NotificationSerializer(notifications, many=True)
    return serializer.data

def get_reservation(reservation_id):
    reservation = Reservation.objects.get(id=reservation_id)
    serializer = ReservationSerializer(reservation)
    return serializer.data

def get_reservation_by_booker(booker):
    reservation = Reservation.objects.filter(Q(booker=booker) & Q(reservation_end__gte=datetime.now()))
    serializer = ReservationSerializer(reservation, many=True)
    return serializer.data

def get_reservation_by_driver(driver_id):
    reservation = Reservation.objects.filter(Q(driver=driver_id) & Q(reservation_end__gte=datetime.now()))
    serializer = ReservationSerializer(reservation, many=True)
    return serializer.data

def get_reservation_by_battalion(battalion_id):
    reservation = Reservation.objects.select_related('car').filter(Q(car__id__startswith=battalion_id) & Q(reservation_end__gte=datetime.now()))
    serializer = ReservationSerializer(reservation, many=True)
    return serializer.data