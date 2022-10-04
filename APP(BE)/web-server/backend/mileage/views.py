from django.shortcuts import render
from rest_framework.views import APIView
from django.db.models import Q
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from .utils import *

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