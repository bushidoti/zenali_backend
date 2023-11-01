from django.db import models


class SaleFactor(models.Model):
    code = models.BigIntegerField("کد ثبت", primary_key=True, unique=True)
    jsonData = models.JSONField("کپسول اقلام فاکتور", blank=False, null=True)
    date = models.DateField("تاریخ", default='', blank=False, null=False)
    total = models.FloatField("مبلغ کل", blank=True, null=True)
    tax = models.FloatField("مالیات", blank=True, null=True)
    discount = models.FloatField("تخفیف", blank=True, null=True)
    extra = models.FloatField("تخفیف", blank=True, null=True)
    paid = models.FloatField("مبلغ پرداختی", blank=True, null=True)

    class Meta:
        verbose_name_plural = "فاکتور های فروش"


class AutoIncrementSaleFactor(models.Model):
    increment = models.BigIntegerField("شمارنده", blank=True, null=True)

    class Meta:
        verbose_name_plural = "شمارنده کد فاکتور"


class Sale(models.Model):
    date = models.DateField("تاریخ", default='', blank=True, null=True)
    factorCode = models.ForeignKey(SaleFactor, on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        verbose_name_plural = "گزراش فروش"
