from django.shortcuts import render
from django.db.models import Q
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions, status, filters
from rest_framework.decorators import authentication_classes, api_view, permission_classes
from .utils import get_user, get_notification, get_reservation, get_reservation_by_booker, get_reservation_by_driver, get_reservation_by_battalion, get_car 
from .serializers import NotificationSerializer, ReservationBookingSerializer, ReservationSerializer, CarSerializer, AvailableCarSerializer 
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
from .models import Reservation, Notification, Car
from login.models import User
from rest_framework_simplejwt.authentication import JWTAuthentication
import datetime

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
    
    @swagger_auto_schema(request_body=NotificationSerializer, operation_summary='알림 보내기', operation_description='''
                                                                                                            request:
                                                                                                                type_of_notification: 알림 종류 예)배차예약, 응급 구조 신청
                                                                                                                message: 보내고자 하는 내용
                                                                                                                battalion_receiver: 전파하고자 하는 부대의 코드(4자)
                                                                                                                user_sender: 보내는 사람의 user_id (현 사용자)
                                                                                                                permission: 관리자 2, 대대원 전체 1, 모든 앱 사용자 0
                                                                                                                reservation: 배차 예약과 관련된 알림이라면 reservation_id를 추가
                                                                                                            response:
                                                                                                                type: object
                                                                                                                model: Notification
                                                                                                            
                                                                                                            ''')
    def post(self, request):    
        serializer = NotificationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class car(APIView):
    get_params = [
        openapi.Parameter(
            "car_id",
            openapi.IN_QUERY,
            description="car_id",
            type=openapi.TYPE_STRING,
            default=""
    )]
    @swagger_auto_schema(manual_parameters=get_params, operation_summary='차량 정보 얻기', operation_description='''
                                                                                                            request:
                                                                                                                car_id: 4자 부대코드 + 차량번호
                                                                                                            response:
                                                                                                                type: object
                                                                                                                model: Car
                                                                                                            ''')
    def get(self, request):
        car_id = request.GET['car_id']
        return Response(get_car(car_id))
    
    @swagger_auto_schema(request_body=CarSerializer, operation_summary='차량 추가하기', operation_description='''
                                                                                                            request:
                                                                                                                id: 4자 부대코드 + 차량 번호
                                                                                                                car_model: 차량 모델
                                                                                                                can_ride: 탑승 가능한 총 인원
                                                                                                                propulsion_type: 연료 종류
                                                                                                                color: 차량 색상
                                                                                                            response:
                                                                                                                type: object
                                                                                                                model: Car
                                                                                                            ''')
    def post(self, request):    
        serializer = CarSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @swagger_auto_schema(manual_parameters=[
        openapi.Parameter(
            "car_id",
            openapi.IN_QUERY,
            description="car_id",
            type=openapi.TYPE_STRING,
            default=""
    )], operation_summary='차량 정보 삭제하기',
    operation_description='''
                        car_id: 삭제하고자 하는 차량의 ID(4자 부대코드 + 차량 번호)
                        response:
                            type: only status
                        ''')
    def delete(self, request):
        try: 
            car_id = request.GET['car_id']
            Car.objects.get(id=reservation_id).delete()
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

class reservation(APIView):
    get_params = [
        openapi.Parameter(
            "booker_id",
            openapi.IN_QUERY,
            description="booker_id",
            type=openapi.TYPE_INTEGER,
            default=-1
    ),
        openapi.Parameter(
                "driver_id",
                openapi.IN_QUERY,
                description="driver_id",
                type=openapi.TYPE_INTEGER,
                default=-1
    )
    ,
        openapi.Parameter(
                "reservation_id",
                openapi.IN_QUERY,
                description="reservation_id",
                type=openapi.TYPE_INTEGER,
                default=-1
    )
    ,
        openapi.Parameter(
                "battalion_id",
                openapi.IN_QUERY,
                description="battalion_id",
                type=openapi.TYPE_INTEGER,
                default=-1
    )
    ]
    @swagger_auto_schema(manual_parameters=get_params, operation_summary='배차 예약 정보 얻기', 
                        operation_description='''
                        하나에만 값을 넣어야 함
                        나머지는 -1을 입력

                        request:
                            booker_id: 신청한 user의 user_id
                        response:
                            type: list
                            model: Reservation
                        
                        request:
                            driver_id: 운전자 User의 user_id
                        response:
                            type: list
                            model: Reservation
                    
                        request:
                            reservation_id: 예약한 reservation의 id
                        response:
                            type: object
                            model: Reservation

                        request:                   
                            battalion_id: 부대코드
                        response:
                            type: list
                            model Reservation

                        ''')
    def get(self, request):
        try:
            booker_id = int(request.GET['booker_id'])
            driver_id = int(request.GET['driver_id'])
            reservation_id = int(request.GET['reservation_id'])
            battalion_id = int(request.GET['battalion_id'])

            if booker_id != -1:
                return Response(get_reservation_by_booker(booker_id), status=status.HTTP_200_OK)
            elif driver_id != -1:
                return Response(get_reservation_by_driver(driver_id), status=status.HTTP_200_OK)
            elif battalion_id != -1:
                return Response(get_reservation_by_battalion(battalion_id), status=status.HTTP_200_OK)
            elif reservation_id != -1:
                return Response(get_reservation(reservation_id), status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)

    @swagger_auto_schema(request_body=ReservationBookingSerializer , operation_summary='배차 예약하기'
                                                                    ,operation_description='''
                                                                                        request:
                                                                                            booker: 예약자의 user_id(현재 사용자)
                                                                                            car: 예약하고자 하는 차량의 ID(4자 부대코드 + 차량 번호)
                                                                                            departure: 출발지
                                                                                            destination: 도착지
                                                                                            followers_num: 같이 따라오는 인원(운전병, 선탑자 제외),
                                                                                            stopover: 경유지
                                                                                            is_sharing: 공유 여부
                                                                                            reservation_start: 예약 시작일
                                                                                            reservation_end: 예약 종료일
                                                                                            reason: 배차 예약 이유(간략하게)
                                                                                        response:
                                                                                            type: object
                                                                                            model: Reservation
                                                                                        ''')
    def post(self, request):
        serializer = ReservationBookingSerializer(data=request.data)
        if serializer.is_valid():
            reservation = Reservation.objects.select_related('driver').filter(Q(driver__battalion_id=int(str(serializer.validated_data["car"].id)[:4])) & # 이거 왜 int 추가해야 되는 건지 잘 모르겠음 여튼 int 안하면 안됨
                                                                           (Q(reservation_start__range=[serializer.validated_data["reservation_start"], serializer.validated_data["reservation_end"]]) | 
                                                                           Q(reservation_end__range=[serializer.validated_data["reservation_start"], serializer.validated_data["reservation_end"]])) &
                                                                           Q(status=1))
            if len(reservation) != 0: #예약이 있을 때 배차가 없는 운전병을 배치    
                reservation = reservation.values()
                already_reserved = [rv["driver_id"] for rv in reservation]
                available_driver = User.objects.filter(
                    Q(permission=2) &
                    ~Q(id__in=already_reserved) &
                    Q(battalion_id=str(serializer.validated_data["car"].id)[:4])
                )
                if len(available_driver) == 0: 
                    return Response("대기중인 운전병이 없습니다.", status=status.HTTP_406_NOT_ACCEPTABLE)
                serializer.save(driver=available_driver[0])
            else: #예약이 없을 때는 아무 0번째 운전병을 배치
                serializer.save(driver=User.objects.filter(Q(permission=2) & 
                                                        Q(battalion_id=str(serializer.validated_data["car"].id)[:4]))[0])
            battalion_receiver = str(serializer.data["car"])[:4]
            user = get_user(serializer.data["booker"])
            Notification.objects.create(
                user_sender=user,
                battalion_receiver=battalion_receiver,
                permission=1,
                reservation=serializer.instance,
                message=f"{user.login_id}이(가) 배차를 신청했습니다."
            )
            
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
    @swagger_auto_schema(manual_parameters=[
        openapi.Parameter(
            "reservation_id",
            openapi.IN_QUERY,
            description="reservation_id",
            type=openapi.TYPE_INTEGER,
            default=""
    )], operation_summary='배차 예약 정보 삭제하기'
    ,operation_description='''
                        request:
                            reservation_id: 예약 정보를 삭제할 예약의 ID
                        response:
                            type: only status
                        ''')
    def delete(self, request):
        try: 
            reservation_id = request.GET['reservation_id']
            Reservation.objects.get(id=reservation_id).delete()
            return Response(status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response(status=status.HTTP_400_BAD_REQUEST)



@swagger_auto_schema(method='post', request_body=openapi.Schema(
          'reservation_id',
          type=openapi.TYPE_OBJECT,
          properties={
            'reservation_id': openapi.Parameter('reservation_id', openapi.IN_BODY, type=openapi.TYPE_INTEGER),
            'status': openapi.Parameter('status', openapi.IN_BODY, type=openapi.TYPE_INTEGER)
        },
    ), operation_summary='배차 예약 승인하기'
    ,operation_description='''
                        request:
                            reservation_id: 승인할 예약의 id
                            승인이면 status에 1을 넣고
                            거절이면 status에 -1을 넣는다.
                        response:
                            type: only status
                        ''')
@api_view(['POST'])
@permission_classes((permissions.AllowAny)) #admin에서 접근할 예정이라 authentication 제거
def approve_reservation(request):
    try:
        reservation_id = request.data['reservation_id']
        reservation = Reservation.objects.get(id=reservation_id)
        reservation.status = request.data['status']
        reservation.save()
        return Response(status=status.HTTP_202_ACCEPTED)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)

@swagger_auto_schema(method='post', request_body=AvailableCarSerializer , operation_summary='배차 가능한 차량 검색하기'
                                                                        , operation_description='''
                                                                                                request:
                                                                                                    battalion_id : 부대 번호(4자리)
                                                                                                    departure: 출발지
                                                                                                    destination: 도착지
                                                                                                    followers_num: 같이 따라오는 인원(운전병, 선탑자 제외),
                                                                                                    stopover: 경유지
                                                                                                    reservation_start: 예약 시작일
                                                                                                    reservation_end: 예약 종료일
                                                                                                response:
                                                                                                    type: list
                                                                                                    model: Car
                                                                                                ''')    
@api_view(['POST'])
def get_available_car(request):
    try:
        serializer = AvailableCarSerializer(data=request.data)
        if serializer.is_valid():
            reservation = Reservation.objects.select_related('car').filter(Q(car__id__startswith=serializer.data["battalion"]) &
                                                                           (Q(reservation_start__range=[serializer.data["reservation_start"], serializer.data["reservation_end"]]) | 
                                                                           Q(reservation_end__range=[serializer.data["reservation_start"], serializer.data["reservation_end"]])) &
                                                                           Q(status=1))
            reservation = reservation.values()
            already_reserved = [rv["car_id"] for rv in reservation]
            available_car = Car.objects.filter(
                Q(can_ride__gte=(serializer.data["followers_num"]+2)) &
                ~Q(id__in=already_reserved)
            )
            ret_seriallizer = CarSerializer(available_car, many=True)
            return Response(ret_seriallizer.data, status=status.HTTP_200_OK)
        return Response("serilalizer isn't valid",status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)


@swagger_auto_schema(method='post', request_body=openapi.Schema(
          'reservation_id',
          type=openapi.TYPE_OBJECT,
          properties={
            'reservation_id': openapi.Parameter('reservation_id', openapi.IN_BODY, type=openapi.TYPE_INTEGER),
            'safety_checklist': openapi.Parameter('safety_checklist', openapi.IN_BODY, type=openapi.TYPE_BOOLEAN)
        },
    ), operation_summary='안전점검표 확인 여부'
    ,operation_description='''
                        request:
                            reservation_id: 점검표를 추가할 예약의 ID
                            안전점검표가 전부 체크되었으면 safety_checklist에 True를 넣고,
                            아니라면 False를 넣는다.
                        response:
                            type: only status
                        ''')
@api_view(['POST'])
def safety_checklist(request):
    try:
        reservation_id = request.data['reservation_id']
        reservation = Reservation.objects.get(id=reservation_id)
        reservation.safety_checklist = request.data['safety_checklist']
        reservation.save()
        return Response(status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)

@swagger_auto_schema(method='post', request_body=openapi.Schema(
          'reservation_id',
          type=openapi.TYPE_OBJECT,
          properties={
            'reservation_id': openapi.Parameter('reservation_id', openapi.IN_BODY, type=openapi.TYPE_INTEGER),
            'operation_plan': openapi.Parameter('operation_plan', openapi.IN_BODY, type=openapi.TYPE_STRING)
        },
    ), operation_summary='운행 계획 작성'
    ,operation_description='''
                        request:
                            reservation_id: 운행 계획를 추가할 예약의 ID
                            operation_plan: 계획 내용 
                        response:
                            type: only status
                        ''')
@api_view(['POST'])
def add_operation_plan(request):
    try:
        reservation_id = request.data['reservation_id']
        reservation = Reservation.objects.get(id=reservation_id)
        reservation.operation_plan = request.data['operation_plan']
        reservation.save()
        return Response(status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)

get_params = [
        openapi.Parameter(
                "reservation_id",
                openapi.IN_QUERY,
                description="reservation_id",
                type=openapi.TYPE_INTEGER,
                default=0
    )
    ]
@swagger_auto_schema(method='get', manual_parameters=get_params, operation_summary='차량 반납', 
                    operation_description='''
                    request:
                        reservation_id: 반납할 차량의 ID(4자 부대코드 + 차량 번호)
                    response:
                        type: only status
                    ''')
@api_view(['GET'])
def finish_using(request):
    reservation_id = request.GET['reservation_id']
    try:
        reservation = Reservation.objects.get(id=reservation_id)
        reservation.status = 2
        reservation.save()
        return Response(status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response(status=status.HTTP_400_BAD_REQUEST)
