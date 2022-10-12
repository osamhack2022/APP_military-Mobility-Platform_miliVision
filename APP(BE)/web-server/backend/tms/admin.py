from django.contrib import admin
from django import forms
from .models import Car, Notification, Reservation
from django.template.response import TemplateResponse
from django.http import Http404
from django.urls import path


admin.site.register(Notification)

class CarAdmin(admin.ModelAdmin):
    model = Car
    list_display = ('id', 'license_plate', 'car_model', 'can_ride', 'propulsion_type', 'color')
    list_filter = ('id', 'license_plate', 'car_model', 'can_ride', 'propulsion_type', 'color')
    fieldsets = (
        (None, {'fields': ('id', 'license_plate', 'car_model', 'can_ride', 'propulsion_type', 'color')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',), 
            'fields': ('id', 'license_plate', 'car_model', 'can_ride', 'propulsion_type', 'color')}
        ),
    )
    search_fields = ('id', 'car_model')
    ordering = ('id', 'car_model')

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        is_superuser = request.user.is_superuser

        if not is_superuser:
            pass

        return form

    #super 유저는 전부 접근 가능하고 staff 유저들은 본인의 부대의 car 정보만 볼 수 있음
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(id__startswith=request.user.battalion_id)

admin.site.register(Car, CarAdmin)

class ReservationAdmin(admin.ModelAdmin):
    model = Reservation
    list_display = ('id', 'booker', 'car', 'driver', 'driving_by_self', 'departure', 'destination', 'reservation_start', 'reservation_end', 'status')
    list_filter = ('id', 'booker', 'car', 'driver')
    fieldsets = (
        (None, {'fields': ('booker', 'car', 'driver', 'driving_by_self',  'departure', 'destination','followers_num','stopover', 'is_sharing', 'reservation_start', 'reservation_end', 'status', 'reason', 'safety_checklist', 'operation_plan')}),
    )
    search_fields = ('id', 'booker', 'car', 'driver', 'status')
    ordering = ('id',)
    change_list_template = "admin/reservation_changelist.html"

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        is_superuser = request.user.is_superuser

        if not is_superuser:
            pass

        return form

    #super 유저는 전부 접근 가능하고 staff 유저들은 본인의 부대에 속한 차량의 reservation 정보만 볼 수 있음
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.select_related('car').filter(car__id__startswith=request.user.battalion_id)


    def get_urls(self):
        urls = super(ReservationAdmin, self).get_urls()
        post_urls = [
            path('alert/', self.admin_site.admin_view(self.reservation_status_view))
        ]
        return post_urls + urls

    #어드민 페이지에 alert 페이지 추가
    def reservation_status_view(self, request):
        if request.user == None:
            raise Http404("User does not exist")
        print(request.user)
        context = dict(
            self.admin_site.each_context(request),
            notifications=Notification.objects.filter(battalion_receiver=request.user.battalion_id),
            user=request.user
        )
        return TemplateResponse(request, "admin/reservation_notification.html", context)
admin.site.register(Reservation, ReservationAdmin)
