from django.contrib import admin
from .models import Car, Notification, Reservation

admin.site.register(Car)
admin.site.register(Reservation)
admin.site.register(Notification)
# Register your models here.
