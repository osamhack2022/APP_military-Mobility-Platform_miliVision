from django.contrib import admin
from .models import Incident, Rescue

admin.site.register(Incident)
admin.site.register(Rescue)