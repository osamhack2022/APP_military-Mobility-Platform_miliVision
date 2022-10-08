from django.urls import path
from . import views

urlpatterns = [
    path("incident", views.incident.as_view()),
]