from django.urls import path
from . import views
from rest_framework_simplejwt.views import TokenRefreshView

urlpatterns = [
    path("register", views.RegisterAPIView.as_view()), #회원가입하기
    path("login", views.AuthView.as_view()), #로그인
    path("refresh_token", TokenRefreshView.as_view()),
    path('logout', views.LogoutView.as_view()) #로그아웃
]