from .models import *
from login.models import *
from tms.models import *
from .serializers import *
from django.db.models import Q

def get_history(history_id):
    history = History.objects.get(id=history_id)
    serializer = HistirySerializer(history)
    return serializer.data

def get_history_by_user(user_id):
    history = History.objects.filter(Q(user_id=user_id))
    serializer = HistirySerializer(history, many=True)
    return serializer.data 

def get_history_by_car(car_id):
    history = History.objects.filter(car_id=car_id)
    serializer = HistirySerializer(history, many=True)
    return serializer.data 