from django.shortcuts import render
from rest_framework.views import APIView
from django.db.models import Q
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from .utils import *
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from login.views import get_user_from_access_token
from rest_framework.response import Response
from rest_framework import status
from .serializers import *

# Create your views here.

class history(APIView):
    get_params = [
        openapi.Parameter(
            "user_id",
            openapi.IN_QUERY,
            description="user_id",
            type=openapi.TYPE_STRING,
            default="",
        ),
    ]
    
    @swagger_auto_schema(manual_parameters=get_params, 
                         operation_summary='주행 기록 얻기', 
                         operation_description='''
                                            ---request---
                                               없음 : 요청한 토큰의 이용자 객체를 받아옴
                                            ---response---
                                               type: object
                                               model: History
                                               '''
                                               )
    def get(self, request):
        # try:
        #     token = request.META['HTTP_AUTHORIZATION'][7:]
        #     user = get_user_from_access_token(token)
        #     user_id = user.id
        #     # user_id = request.GET['user_id']
        #     # return Response(get_history_by_user(user_id), status=status.HTTP_200_OK)
        #     return Response(get_history(), status=status.HTTP_200_OK)
            
        # except Exception as e:
        #     print(e)
        #     return Response(status=status.HTTP_400_BAD_REQUEST)
        token = request.META['HTTP_AUTHORIZATION'][7:]
        user = get_user_from_access_token(token)
        historys = History.objects.filter(user_id=user.id)
        serializer = HistorySerializer(historys, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK) 
    
    @swagger_auto_schema(request_body=HistorySerializer, 
                         operation_summary="주행기록 작성하기",
                         operation_description='''
                                                ---request---
                                                user_id: (int)요청한 사용자의 id / ex) 4
                                                car_id: (int)탑승한 차의 id / ex) 1111001
                                                department: (string) 출발지 / ex) 서울
                                                arrival: (string) 도착지 / ex) 진해
                                                datetime: (datetime) 운행한 날짜 / ex) 2022-10-10T13:54:39.700000+09:00
                                                total_time: (int) 운행한 총 시간 / ex) 7
                                                total_range: (int) 운행한 총 거리 / ex) 412
                                                ---response---
                                                type: object
                                                model: History
                                               ''')
    def post(self, request):
        serializer = HistorySerializer(data=request.data)
        if serializer.is_valid():
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
    	)], 
                        operation_summary='주행기록 삭제하기',
                        operation_description= '''
                                               ---request---
                                               history_id: (int) 삭제하고 싶은 History의 id
                                               ---reponse---
                                               None
                                               ''')
    def delete(self, request):
        try:
            history_id = request.GET['history_id']
            History.objects.get(id=history_id).delete()
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)
