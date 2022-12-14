from django.contrib.auth import get_user_model
from rest_framework import serializers

User = get_user_model()

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["password",
                    "login_id",
                    "email",
                    "battalion_id",
                    "is_staff",
                    "permission"] #나중에 이걸 바꿔서 회원가입할 때 쓸 값을 추가해야 함

    def create(self, validated_data):
        login_id = validated_data.get('login_id')
        email = validated_data.get('email')
        battalion_id = validated_data.get('battalion_id')
        password = validated_data.get('password')
        permission = validated_data.get('permission')
        is_staff = validated_data.get('is_staff')
        user = User(
            login_id=login_id,
            email=email,
            battalion_id=battalion_id,
            permission=permission,
            is_staff=is_staff,
            is_active=True
        )
        user.set_password(password)
        user.save()
        return user

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
