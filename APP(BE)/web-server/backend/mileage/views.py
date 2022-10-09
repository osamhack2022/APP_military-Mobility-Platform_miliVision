from django.shortcuts import render
from rest_framework.views import APIView
from django.db.models import Q
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from .utils import *
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from login.views import get_user_from_access_token

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
        # 차를 기준으로 검색하는 기능은 필요없을 것으로 판단
        # openapi.Parameter(
        #     "car_id",
        #     openapi.IN_QUERY,
        #     description="car_id",
        #     type=openapi.TYPE_INTEGER,
        #     default=-1,
        # ),
    ]
    
    @swagger_auto_schema(manual_parameters=get_params, operation_summary='운행 기록 얻기')
    def get(self, request):
        try:
            token = request.META['HTTP_AUTHORIZATION'][7:]
            user = get_user_from_access_token(token)
            user_id = user.id
            # car_id = int(request.GET['car_id'])
    
            if user_id != -1:
                return Response(get_history_by_user(user_id), status=status.HTTP_200_OK)
            # 차를 기준으로 검색하는 기능은 필요 없을 것으로 판단
            # elif car_id != -1:
            #     return Response(get_history_by_car(car_id), status=status.HTTP_200_OK)
            
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