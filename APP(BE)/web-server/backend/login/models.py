from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin

# Create your models here.
class UserManager(BaseUserManager):
    use_in_migrations = True

    def create_user(self, login_id, email, password, permission,**kwargs):
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            login_id=login_id,
            email=email,
            permission=permission
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, login_id=None, email=None, password=None, permission=1, **extra_fields):
        superuser = self.create_user(
            login_id=login_id,
            email=email,
            password=password,
            permission=permission
        )
        superuser.is_staff = True
        superuser.is_superuser = True
        superuser.is_admin = True
        superuser.save(using=self._db)
        return superuser


class User(AbstractBaseUser, PermissionsMixin):
    login_id = models.CharField(max_length=30, unique=True, null=False, blank=False)
    email = models.EmailField(max_length=30, unique=True, null=False, blank=False)
    battalion_id = models.CharField(max_length=10, null=False, blank=False)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    permission=models.PositiveIntegerField(default=0) # 0 사용자, 1 수송 관리자, 2 운전병 
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


    objects = UserManager()

    USERNAME_FIELD = 'login_id'
    REQUIRED_FIELDS = ['email', 'battalion_id']

    class Meta:
        db_table = 'user'