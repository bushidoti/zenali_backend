from django.contrib import admin
from .models import *


class RawMaterialAdmin(admin.ModelAdmin):
    list_display = ['code', 'name', 'scale']
    list_editable = ['name', 'scale']
    list_per_page = 10
    search_fields = (
        "code",
        "name",
    )


class RawMaterialCheckAdmin(admin.ModelAdmin):
    list_display = ['code', 'date']
    list_per_page = 10
    search_fields = (
        "code",
    )


class RawMaterialFactorAdmin(admin.ModelAdmin):
    list_display = ['code', 'date']
    list_per_page = 10
    search_fields = (
        "code",
    )


class RawMaterialDetailedAdmin(admin.ModelAdmin):
    list_display = ['product', 'name', 'document_type', 'systemID',
                    'document_code', 'date', 'operator', 'operator', 'input', 'output', 'rate', 'average_rate',
                    'amount', 'afterOperator', 'consumable',
                    'buyer', 'seller', 'receiver', 'amendment']
    list_per_page = 10
    search_fields = (
        "product__code",
        "product__name",
        "systemID",
    )


class ConsumingMaterialAdmin(admin.ModelAdmin):
    list_display = ['code', 'name', 'scale']
    list_editable = ['name', 'scale']
    list_per_page = 10
    search_fields = (
        "code",
        "name",
    )


class ConsumingMaterialCheckAdmin(admin.ModelAdmin):
    list_display = ['code', 'date']
    list_per_page = 10
    search_fields = (
        "code",
    )


class ConsumingMaterialFactorAdmin(admin.ModelAdmin):
    list_display = ['code', 'date']
    list_per_page = 10
    search_fields = (
        "code",
    )


class ConsumingMaterialDetailedAdmin(admin.ModelAdmin):
    list_display = ['product', 'name', 'document_type', 'systemID',
                    'document_code', 'date', 'operator', 'operator', 'input', 'output', 'rate', 'average_rate',
                    'amount', 'afterOperator', 'consumable',
                    'buyer', 'seller', 'receiver', 'amendment']
    list_per_page = 10
    search_fields = (
        "product__code",
        "product__name",
        "systemID",
    )


class RequestSupplyAdmin(admin.ModelAdmin):
    list_display = ['applicant', 'purpose', 'date', 'supplement', 'which_request', 'is_delivered']
    list_per_page = 10


class ProductionAdmin(admin.ModelAdmin):
    list_display = ['code', 'name', 'amount', 'cost',
                    'checkCode']
    list_per_page = 10
    search_fields = (
        "code",
        "name",
    )


class ProductionCheckAdmin(admin.ModelAdmin):
    list_display = ['code', 'date']
    list_per_page = 10
    search_fields = (
        "code",
    )


class WasteAdmin(admin.ModelAdmin):
    list_display = ['product', 'checkCode', 'date']
    list_per_page = 10
    search_fields = (
        "product__code",
        "checkCode__code",
    )


class WasteCheckAdmin(admin.ModelAdmin):
    list_display = ['code', 'date']
    list_per_page = 10
    search_fields = (
        "code",
    )


admin.site.register(RawMaterial, RawMaterialAdmin)
admin.site.register(RawMaterialCheck, RawMaterialCheckAdmin)
admin.site.register(RawMaterialFactor, RawMaterialFactorAdmin)
admin.site.register(RawMaterialDetailed, RawMaterialDetailedAdmin)
admin.site.register(ConsumingMaterial, ConsumingMaterialAdmin)
admin.site.register(ConsumingMaterialCheck, ConsumingMaterialCheckAdmin)
admin.site.register(ConsumingMaterialFactor, ConsumingMaterialFactorAdmin)
admin.site.register(ConsumingMaterialDetailed, ConsumingMaterialDetailedAdmin)
admin.site.register(RequestSupply, RequestSupplyAdmin)
admin.site.register(Production, ProductionAdmin)
admin.site.register(ProductionCheck, ProductionCheckAdmin)
admin.site.register(Waste, WasteAdmin)
admin.site.register(WasteCheck, WasteCheckAdmin)
