from rest_framework import serializers

class NotificationSerializer(serializers.ModelSerializer):
    status=serializers.CharField(max_length=264)
    type_of_notification=serializers.CharField(max_length=264)

