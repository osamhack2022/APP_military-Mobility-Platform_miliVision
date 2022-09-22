from .models import Users, Notification
from .serializers import NotificationSerializer

def get_user(user_id):
    try:
        return Users.objects.get(id=user_id)
    except:
        return AnonymousUser()

def get_notification():
    notifications = Notification.objects.all()
    serializer = NotificationSerializer(notifications, many=True)
    return serializer.data