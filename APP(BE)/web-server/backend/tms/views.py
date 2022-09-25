from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions, status, filters
from rest_framework.decorators import authentication_classes, api_view
from .utils import get_user, get_notification, get_reservation
from .serializers import NotificationSerializer, ReservationSerializer
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
from .models import Reservation
from rest_framework_simplejwt.authentication import JWTAuthentication


# ws test - 1
def index(request):
    return render(request, 'index.html')

# ws test - 2
def battalion(request, battalion):
    return render(request, 'battalion.html', {
        'battalion': battalion
    })

class notification(APIView):

    def get(self, request):
        return Response(get_notification())
    
    @swagger_auto_schema(request_body=NotificationSerializer)
    def post(self, request):
        serializer = NotificationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    # def delete(self, request):
    #     reservation_id = 

class reservation(APIView):
    get_params = [
        openapi.Parameter(
            "login_id",
            openapi.IN_QUERY,
            description="login_id",
            type=openapi.TYPE_STRING,
            default=""
    )]
    @swagger_auto_schema(manual_parameters=get_params)
    def get(self, request):
        try: 
            login_id = request.GET['login_id'] 
            return Response(get_reservation(login_id), status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @swagger_auto_schema(request_body=ReservationSerializer)
    def post(self, request):
        serializer = ReservationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@swagger_auto_schema(method='post', request_body=openapi.Schema(
          'reservation_id',
          type=openapi.TYPE_OBJECT,
          properties={
              'reservation_id': openapi.Parameter('reservation_id', openapi.IN_BODY, type=openapi.TYPE_STRING)
        },
    ),)
@api_view(['POST'])
def approve_reservation(request):
    try:
        reservation_id = request.data['reservation_id']
        reservation = Reservation.objects.get(id=reservation_id)
        reservation.is_approved = True
        reservation.save()
        return Response(status=status.HTTP_202_ACCEPTED)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)

# @api_view(['GET'])
# def get_remained_car(request):
#     try:
#         reservation_id = request.data['reservation_id']
#         Reservation = Reservation.objects.get(id=reservation_id)
#         Reservation.is_approved = True
#         Reservation.save()
#         return Response(status=status.HTTP_202_ACCEPTED)
#     except Exception as e:
#         return Response(status=status.HTTP_400_BAD_REQUEST)