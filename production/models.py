from django.db import models
from industrial_warehouse.models import RequestSupply
from django_jalali.db import models as jmodels


class PendingProduce(models.Model):
    raw_material_jsonData = models.JSONField("کپسول مواد اولیه", blank=False, null=True)
    consuming_material_jsonData = models.JSONField("کپسول مواد مصرفی", blank=False, null=True)
    purpose = models.CharField("دلیل", default='', max_length=150, blank=False, null=False)
    status = models.CharField("وضعیت", default='', max_length=150, blank=False, null=False)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    amount = models.BigIntegerField("تعداد", blank=True, null=True)
    request = models.ForeignKey(RequestSupply, on_delete=models.CASCADE, blank=True, null=True, verbose_name="شماره "
                                                                                                             "سفارش "
                                                                                                             "مرتبط")

    class Meta:
        verbose_name_plural = "انبار تولید"
