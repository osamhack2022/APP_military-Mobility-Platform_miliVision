from django.db import models

# Create your models here.

class Car(models.Model):
    car_id = models.AutoField(primary_key=True)  
    image = models.ImageField(upload_to='car_image', null=True)  # 차의 이미지 저장
    number = models.CharField(max_length=50)    # 34다1234
    model = models.CharField(max_length=50)     # 소나타
    num_of_passanger = models.IntegerField()    # 4
    propulsion_type = models.CharField(max_length=50)  # 휘발유, 전기, 경유
    color = models.CharField(max_length=20)     # 검은색
    location = models.CharField(max_length=50)  # 진해
    need_license = models.IntegerField()        # 면허의 포함관계를 설정해 수정 필요
    
    