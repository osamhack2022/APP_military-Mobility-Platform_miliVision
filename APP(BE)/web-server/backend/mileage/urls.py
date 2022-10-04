from django.urls import path

from . import views

urlpatterns = [
    path('', views.history.as_view(), name='history'),
]