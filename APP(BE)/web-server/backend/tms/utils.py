from .models import Reservation, Notification
from login.models import User
from .serializers import NotificationSerializer, ReservationSerializer

def get_user(login_id):
    try:
        return User.objects.get(login_id=login_id)
    except:
        return AnonymousUser()

def get_notification():
    notifications = Notification.objects.all()
    serializer = NotificationSerializer(notifications, many=True)
    return serializer.data

def get_reservation(login_id):
    reservation = Reservation.objects.filter(driver=get_user(login_id).id)
    serializer = ReservationSerializer(reservation, many=True)
    return serializer.data