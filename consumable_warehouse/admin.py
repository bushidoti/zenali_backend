from django.contrib import admin
from .models import *


class ProductAdmin(admin.ModelAdmin):
    list_display = ['code', 'name', 'category', 'scale']
    list_editable = ['name', 'category', 'scale']
    list_per_page = 10
    list_filter = ['category']
    search_fields = (
        "code",
        "name",
    )


class ProductDetailedAdmin(admin.ModelAdmin):
    list_display = ['product', 'name', 'category', 'document_type', 'systemID',
                    'document_code', 'date', 'operator', 'scale', 'operator', 'afterOperator', 'consumable',
                    'buyer', 'seller', 'receiver', 'amendment']
    list_per_page = 20
    list_filter = ['consumable', 'operator', 'document_type', 'product__category']
    search_fields = (
        "product__code",
        "product__name",
        "systemID"
    )


class FactorsProductAdmin(admin.ModelAdmin):
    list_display = ['code']
    list_per_page = 20
    search_fields = (
        "code",
    )


class ProductCheckAdmin(admin.ModelAdmin):
    list_display = ['code']
    list_per_page = 20
    search_fields = (
        "code",
    )


admin.site.register(Consumable)
admin.site.register(Category)
admin.site.register(Product, ProductAdmin)
admin.site.register(ProductDetailed, ProductDetailedAdmin)
admin.site.register(ProductFactor, FactorsProductAdmin)
admin.site.register(ProductCheck, ProductCheckAdmin)
