from django.contrib import admin
from .models import ApplyBuy


class ApplyBuyAdmin(admin.ModelAdmin):
    list_display = ['name', 'amount', 'scale', 'applicant', 'description', 'date']
    list_per_page = 10
    search_fields = (
        "name",
    )


admin.site.register(ApplyBuy, ApplyBuyAdmin)
