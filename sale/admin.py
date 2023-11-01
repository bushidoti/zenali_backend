from django.contrib import admin
from .models import Sale, SaleFactor, AutoIncrementSaleFactor


class SaleAdmin(admin.ModelAdmin):
    list_display = ['factorCode', 'date']
    list_per_page = 10
    search_fields = (
        "factorCode",
    )


class SaleFactorAdmin(admin.ModelAdmin):
    list_display = ['code', 'date', 'total', 'tax', 'discount', 'extra', 'paid']
    list_per_page = 10
    search_fields = (
        "code",
    )


admin.site.register(Sale, SaleAdmin)
admin.site.register(SaleFactor, SaleFactorAdmin)
admin.site.register(AutoIncrementSaleFactor)
