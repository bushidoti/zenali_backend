from django.contrib import admin
from .models import SaleFactor


class SaleFactorAdmin(admin.ModelAdmin):
    list_display = ['code', 'date', 'total', 'tax', 'discount', 'extra', 'paid']
    list_per_page = 10
    search_fields = (
        "code",
    )


admin.site.register(SaleFactor, SaleFactorAdmin)
