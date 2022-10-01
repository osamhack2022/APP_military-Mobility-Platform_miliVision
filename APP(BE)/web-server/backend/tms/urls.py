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
    path('safety_checklist/', views.safety_checklist, name='safety_checklist'),
    path('add_operation_plan/', views.add_operation_plan, name='add_operation_plan'),
    path('finish_using/', views.finish_using, name='finish_using'),
]