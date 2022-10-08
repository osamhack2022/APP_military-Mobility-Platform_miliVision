from django.shortcuts import render
from django.contrib.auth import authenticate
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated, AllowAny
from .serializers import RegisterSerializer, UserSerializer
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.tokens import RefreshToken
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi


# Create your views here.
class RegisterAPIView(APIView):
    permission_classes = [AllowAny]

    @swagger_auto_schema(request_body=RegisterSerializer, operation_description='''
                                                                                request:
                                                                                    is_staff: admin페이지의 접근 권한 여부
                                                                                    battalion_id: 부대코드(4자)
                                                                                    permission: 0 일반사용자, 1 수송 관리자, 2 운전병
                                                                                response:
                                                                                    user: 생성된 유저 정보
                                                                                    token: authentication token
                                                                                ''')
    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            # jwt token 접근해주기
            token = TokenObtainPairSerializer.get_token(user)
            refresh_token = str(token)
            access_token = str(token.access_token)
            res = Response(
                {
                    "user": serializer.data,
                    "message": "register successs",
                    "token": {
                        "access": access_token,
                        "refresh": refresh_token,
                    },
                },
                status=status.HTTP_200_OK,
            )
            return res
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class AuthView(APIView):
    permission_classes = [AllowAny]

    @swagger_auto_schema(request_body=openapi.Schema(
          'user login',
          type=openapi.TYPE_OBJECT,
          properties={
            'login_id': openapi.Parameter('login_id', openapi.IN_BODY, type=openapi.TYPE_STRING),
            'password': openapi.Parameter('password', openapi.IN_BODY, type=openapi.TYPE_STRING)
        },
        operation_description='''
            request:
                login_id: 로그인 id
                password: 비밀번호
            response:
                user: 생성된 유저 정보
                token: authentication token
            '''
    ))
    def post(self, request):
        user = authenticate(
            login_id=request.data.get("login_id"), password=request.data.get("password")
        )
        if user is not None:
            serializer = UserSerializer(user)
            token = TokenObtainPairSerializer.get_token(user)
            refresh_token = str(token)
            access_token = str(token.access_token)
            res = Response(
                {
                    "user": serializer.data,
                    "message": "login success",
                    "token": {
                        "access": access_token,
                        "refresh": refresh_token,
                    },
                },
                status=status.HTTP_200_OK,
            )
            return res
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)        

class LogoutView(APIView):
    permission_classes = (IsAuthenticated,)

    @swagger_auto_schema(request_body=openapi.Schema(
            'refresh_token',
          type=openapi.TYPE_OBJECT,
          properties={
              'refresh_token': openapi.Parameter('refresh_token', openapi.IN_BODY, type=openapi.TYPE_STRING)
        },
    ),
    operation_description='''
        request:
            refresh_token
        response:
            type: only status
        ''')
    def post(self, request):
        try:
            refresh_token = request.data["refresh_token"]
            token = RefreshToken(refresh_token)
            token.blacklist()

            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)