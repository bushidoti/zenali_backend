from django.db import models
from django_jalali.db import models as jmodels


class SaleFactor(models.Model):
    code = models.BigIntegerField("کد ثبت", primary_key=True, unique=True)
    jsonData = models.JSONField("کپسول اقلام فاکتور", blank=False, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    total = models.BigIntegerField("مبلغ کل", blank=True, null=True)
    tax = models.BigIntegerField("مالیات",blank=True, null=True)
    discount = models.BigIntegerField("تخفیف", blank=True, null=True)
    extra = models.CharField("اضافات", max_length=50, blank=True, null=True)
    paid = models.BigIntegerField("مبلغ پرداختی", blank=True, null=True)

    class Meta:
        verbose_name_plural = "فاکتور های فروش"


class AutoIncrementSaleFactor(models.Model):
    increment = models.BigIntegerField("شمارنده", blank=True, null=True)

    class Meta:
        verbose_name_plural = "شمارنده کد فاکتور"


class Sale(models.Model):
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    factorCode = models.ForeignKey(SaleFactor, on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        verbose_name_plural = "گزراش فروش"
