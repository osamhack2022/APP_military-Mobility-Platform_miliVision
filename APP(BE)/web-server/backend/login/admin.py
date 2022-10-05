from django.contrib import admin
from .models import User
from django.contrib.auth.admin import UserAdmin


class CustomUserAdmin(UserAdmin):
    model = User
    list_display = ('id','login_id', 'battalion_id', 'permission', 'email', 'is_staff', 'is_active',)
    list_filter = ('login_id', 'battalion_id', 'permission', 'email', 'is_staff', 'is_active',)
    fieldsets = (
        (None, {'fields': ('login_id', 'battalion_id', 'permission', 'email', 'password')}),
        ('Permissions', {'fields': ('is_staff', 'is_active','user_permissions')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),   
            'fields': ('login_id', 'battalion_id', 'email', 'permission', 'password1', 'password2', 'is_staff', 'is_active', 'user_permissions')}
        ),
    )
    search_fields = ('battalion_id', 'email')
    ordering = ('battalion_id', 'email')

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        is_superuser = request.user.is_superuser

        if not is_superuser:
            # form.base_fields['login_id'].disabled = True
            # form.base_fields['battalion_id'].disabled = True
            # form.base_fields['permission'].disabled = True
            pass

        return form

    #super 유저는 전부 접근 가능하고 staff 유저들은 본인의 부대의 user 정보만 볼 수 있음
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(battalion_id=request.user.battalion_id)


admin.site.register(User, CustomUserAdmin)