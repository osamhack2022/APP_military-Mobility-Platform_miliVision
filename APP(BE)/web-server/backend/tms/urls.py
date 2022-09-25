from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('battalion/<str:battalion>/', views.battalion, name='battalion'),
    path('notification/', views.notification.as_view(), name='notification'),
    path('reservation/', views.reservation.as_view(), name='reservation'),
    path('approve_reservation/', views.approve_reservation, name='approve_reservation'),
]