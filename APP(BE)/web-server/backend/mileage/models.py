from django.db import models
from datetime import datetime
from tms.models import *
from login.models import *


# Create your models here.

class History(models.Model):
    id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, related_name="user_id", on_delete=models.CASCADE)
    car_id = models.ForeignKey(Car, related_name="car_id", on_delete=models.CASCADE)
    department = models.CharField(max_length=200)
    arrival = models.CharField(max_length=200)
    datetime = models.DateTimeField('drived date', default=datetime.now)
    total_time = models.IntegerField(default=0)
    total_range = models.IntegerField(default=0)
    