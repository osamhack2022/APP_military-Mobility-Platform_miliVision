from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions, status
from .utils import get_user, get_notification
from .serializers import NotificationSerializer
from drf_yasg.utils import swagger_auto_schema

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


    