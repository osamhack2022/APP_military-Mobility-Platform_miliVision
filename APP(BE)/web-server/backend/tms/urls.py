from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('battalion/<str:battalion>/', views.battalion, name='battalion'),
    path('notification/', views.notification.as_view(), name='notification')
]