from django.db import models
from login.models import User
from datetime import datetime

# Create your models here.
class Car(models.Model):
    id=models.PositiveIntegerField(primary_key=True)
    car_model=models.CharField(max_length=30, null=True)
    propulsion_type=models.CharField(max_length=30, null=True)
    color=models.CharField(max_length=30, null=True)
    # location=models.CharField(max_length=30, null=True)

class Reservation(models.Model):
    id=models.AutoField(primary_key=True)
    booker=models.ForeignKey(User,related_name='booker',on_delete=models.CASCADE)
    car=models.ForeignKey(Car,related_name='car',on_delete=models.CASCADE)
    driver=models.ForeignKey(User,related_name='driver',on_delete=models.CASCADE)
    departure=models.CharField(max_length=264,default="")
    destination=models.CharField(max_length=264,default="")
    followers_num=models.PositiveIntegerField(default=0)
    stopover=models.CharField(max_length=264,default="")
    is_sharing=models.BooleanField(default=False)
    reservation_date=models.DateTimeField('reservation date', default=datetime.now)
    is_approved=models.BooleanField(default=False)
    reason=models.CharField(max_length=264,null=True,blank=True,default="")
    created_at=models.DateTimeField('created_at', default=datetime.now, editable=False)

class Notification(models.Model):
    user_sender=models.ForeignKey(User,null=True,blank=True,related_name='user_sender',on_delete=models.CASCADE)
    message=models.CharField(max_length=264,null=True,blank=True,default="")
    status=models.CharField(max_length=264,null=True,blank=True,default="unread")
    reservation=models.ForeignKey(Reservation,null=True,blank=True,related_name='reservation',on_delete=models.CASCADE)
    type_of_notification=models.CharField(max_length=264,null=True,blank=True)