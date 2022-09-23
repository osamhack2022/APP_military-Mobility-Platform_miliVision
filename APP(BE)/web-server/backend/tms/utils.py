from .models import Notification
from login.models import User
from .serializers import NotificationSerializer

def get_user(user_id):
    try:
        return User.objects.get(id=user_id)
    except:
        return AnonymousUser()

def get_notification():
    notifications = Notification.objects.all()
    serializer = NotificationSerializer(notifications, many=True)
    return serializer.data