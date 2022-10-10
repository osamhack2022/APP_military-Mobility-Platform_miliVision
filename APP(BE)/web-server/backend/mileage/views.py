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
                                               없음 : 요청한 토큰의 이용자 객ㅊ를 받아옴
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
        historys = History.objects.all()
        serializer = HistorySerializer(historys, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK) 
    
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
