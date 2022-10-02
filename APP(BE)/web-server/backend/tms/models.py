from django.db import models
from login.models import User

# Create your models here.
class Vehicle(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=30, null=True)

class Notification(models.Model):
    user_sender=models.ForeignKey(User,null=True,blank=True,related_name='user_sender',on_delete=models.CASCADE)
    user_revoker=models.ForeignKey(User,null=True,blank=True,related_name='user_revoker',on_delete=models.CASCADE)
    status=models.CharField(max_length=264,null=True,blank=True,default="unread")
    type_of_notification=models.CharField(max_length=264,null=True,blank=True)
    