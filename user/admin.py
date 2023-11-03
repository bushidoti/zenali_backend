from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from user.models import Employee
from .models import Banner


class EmployeeInline(admin.StackedInline):
    model = Employee
    can_delete = False
    verbose_name = "اطلاعات اضافه"


class UserAdmin(BaseUserAdmin):
    inlines = [EmployeeInline]


admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Banner)
