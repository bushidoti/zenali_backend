from django.contrib import admin
from .models import PendingProduce


class PendingProduceAdmin(admin.ModelAdmin):
    list_display = ['request', 'date', 'status', 'purpose']
    list_per_page = 10
    search_fields = (
        "request",
    )


admin.site.register(PendingProduce, PendingProduceAdmin)
