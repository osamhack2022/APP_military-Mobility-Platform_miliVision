from django.shortcuts import render
from rest_framework.views import APIView
from django.db.models import Q
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from .utils import *
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema

# Create your views here.

class history(APIView):
    get_params = [
        openapi.Parameter(
            "user_id",
            openapi.IN_QUERY,
            description="user_id",
            type=openapi.TYPE_INTEGER,
            default=-1,
        ),
        openapi.Parameter(
            "car_id",
            openapi.IN_QUERY,
            description="car_id",
            type=openapi.TYPE_INTEGER,
            default=-1,
        ),
    ]
    
    @swagger_auto_schema(manual_parameters=get_params, operation_summary='운행 기록 얻기')
    def get(self, request):
        try:
            user_id = int(request.GET['user_id'])
            car_id = int(request.GET['car_id'])
    
            if user_id != -1:
                return Response(get_history_by_user(user_id), status=status.HTTP_200_OK)
            elif car_id != -1:
                return Response(get_history_by_car(car_id), status=status.HTTP_200_OK)
            
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)
    
    @swagger_auto_schema(request_body=historyBookingSerializer, operation_summary="주행기록 작성하기")
    def post(self, request):
        serializer = historyBookingSerializer(data=request.data)
        if serializer.is_vaild():  # serializer가 vaild일 경우 필터링
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
    @swagger_auto_schema(manual_parameters=[
        openapi.Parameter(
            "history_id",
            openapi.IN_QUERY,
            description="history_id",
            type=openapi.TYPE_INTEGER,
            default=""
    )], operation_summary='주행기록 삭제하기')
    def delete(self, request):
        try:
            history_id = request.GET['history_id']
            History.objects.get(id=history_id).delete()
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)