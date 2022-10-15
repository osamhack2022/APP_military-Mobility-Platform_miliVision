from django.urls import path
from . import views

urlpatterns = [
    path('history', views.history.as_view(), name='history'),
]