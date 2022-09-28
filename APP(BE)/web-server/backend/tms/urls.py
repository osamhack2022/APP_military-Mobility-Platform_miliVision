from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('battalion/<str:battalion>/', views.battalion, name='battalion'),
    path('notification/', views.notification.as_view(), name='notification'),
    path('car/', views.car.as_view(), name='car'),
    path('reservation/', views.reservation.as_view(), name='reservation'),
    path('approve_reservation/', views.approve_reservation, name='approve_reservation'),
    path('get_available_car/', views.get_available_car, name='get_available_car'),
]