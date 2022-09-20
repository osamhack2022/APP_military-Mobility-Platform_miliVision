from django.db import models

# Create your models here.
class Vehicle(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=30, null=True)
