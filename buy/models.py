from django.db import models
from django_jalali.db import models as jmodels


class ApplyBuy(models.Model):
    is_supplied = models.BooleanField("تامین شده ؟", blank=True, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام درخواست", blank=False, null=True)

    class Meta:
        verbose_name_plural = "درخواست خرید کالا"
