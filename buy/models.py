from django.db import models
from django_jalali.db import models as jmodels


class ApplyBuy(models.Model):
    name = models.CharField("نام کالا", max_length=100, blank=False, null=True)
    scale = models.CharField("واحد", max_length=50, blank=True, null=True)
    amount = models.FloatField("مقدار", blank=True, null=True)
    applicant = models.CharField("درخواست کننده", max_length=50, blank=False)
    description = models.CharField("توضیحات", default='', max_length=150, blank=False, null=False)
    is_supplied = models.BooleanField("تامین شده ؟", blank=True, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)

    class Meta:
        verbose_name_plural = "درخواست خرید کالا"
