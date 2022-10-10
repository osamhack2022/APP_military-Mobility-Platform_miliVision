from django.shortcuts import render
from .models import Incident, Rescue
from .serializers import IncidentSerializer, RescueSerializer
from tms.models import Notification
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions, status, filters
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
from login.views import get_user_from_access_token

class incident(APIView):
    @swagger_auto_schema(operation_summary='사고 정보 얻기', operation_description='''
                                                                                                            ----response----
                                                                                                                type: list
                                                                                                                model: Incident
                                                                                                            ''')
    def get(self, request):
        return Response(Incident.objects.all())
    
    @swagger_auto_schema(request_body=IncidentSerializer, operation_summary='사고 차량 신고하기', operation_description='''
                                                                                                            ----request----
                                                                                                                car: 사고차량 id
                                                                                                                incident_type: 사고 유형
                                                                                                                location:사고위치
                                                                                                                image: 사고 사진
                                                                                                            ----response----
                                                                                                                type: object
                                                                                                                model: Incident
                                                                                                            ''')
    def post(self, request):    
        serializer = IncidentSerializer(data=request.data)
        if serializer.is_valid():
            token = request.META['HTTP_AUTHORIZATION'][7:]
            user = get_user_from_access_token(token)
            serializer.save(user=user)
            Notification.objects.create(
                user_sender=user,
                battalion_receiver=user.battalion_id,
                type_of_notification="사고 차량 신고",
                permission=1,
                message=f"{user.login_id}이(가) 사고 차량을 신고했습니다.",
                related_id=serializer.instance.id
            )
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @swagger_auto_schema(manual_parameters=[
        openapi.Parameter(
            "incident_id",
            openapi.IN_QUERY,
            description="incident_id",
            type=openapi.TYPE_STRING,
            default=""
    )], operation_summary='사고 정보 삭제하기',
    operation_description='''
                        incident_id: 삭제하고자 하는 사고 정보의 ID
                        ----response----
                            type: only status
                        ''')
    def delete(self, request):
        try: 
            incident_id = request.GET['incident_id']
            Incident.objects.get(id=incident_id).delete()
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)


class rescue(APIView):
    @swagger_auto_schema(operation_summary='구난 신청 정보 얻기', operation_description='''
                                                                                                            ----response----
                                                                                                                type: list
                                                                                                                model: Rescue
                                                                                                            ''')
    def get(self, request):
        return Response(Rescue.objects.all())
    
    @swagger_auto_schema(request_body=RescueSerializer, operation_summary='구난 차량 요청하기', operation_description='''
                                                                                                            ----request----
                                                                                                                car: 사고차량 id
                                                                                                                location:사고위치
                                                                                                                service_needs:요청 서비스
                                                                                                                note: 특이사항
                                                                                                                                                                                                                            ----response----
                                                                                                                type: object
                                                                                                                model: Rescue
                                                                                                            ''')
    def post(self, request):    
        serializer = RescueSerializer(data=request.data)
        if serializer.is_valid():
            token = request.META['HTTP_AUTHORIZATION'][7:]
            user = get_user_from_access_token(token)
            serializer.save(user=user)
            Notification.objects.create(
                user_sender=user,
                battalion_receiver=user.battalion_id,
                type_of_notification="구난 차량 요청",
                permission=1,
                message=f"{user.login_id}이(가) 구난 차량 요청을 했습니다.",
                related_id=serializer.instance.id
            )
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @swagger_auto_schema(manual_parameters=[
        openapi.Parameter(
            "rescue_id",
            openapi.IN_QUERY,
            description="rescue_id",
            type=openapi.TYPE_STRING,
            default=""
    )], operation_summary='구난 신청정보 삭제하기',
    operation_description='''
                        rescue_id: 삭제하고자 하는 신청 정보의 ID
                        ----response----
                            type: only status
                        ''')
    def delete(self, request):
        try: 
            rescue_id = request.GET['rescue_id']
            Rescue.objects.get(id=rescue_id).delete()
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)