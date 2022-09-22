from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class Vehicle(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=30, null=True)

class Users(AbstractUser):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name

class Notification(models.Model):
    user_sender=models.ForeignKey(Users,null=True,blank=True,related_name='user_sender',on_delete=models.CASCADE)
    user_revoker=models.ForeignKey(Users,null=True,blank=True,related_name='user_revoker',on_delete=models.CASCADE)
    status=models.CharField(max_length=264,null=True,blank=True,default="unread")
    type_of_notification=models.CharField(max_length=264,null=True,blank=True)


