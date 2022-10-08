from django.db import models
from login.models import *
from tms.models import Car

class Incident(models.Model):
    user=models.ForeignKey(User,related_name='incident_user',on_delete=models.CASCADE)
    car=models.ForeignKey(Car,related_name='incident_car',on_delete=models.CASCADE)
    incident_type=models.IntegerField(default=0)
    location=models.CharField(max_length=30)
    image=models.ImageField(blank=True)