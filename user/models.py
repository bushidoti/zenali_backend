from django.db import models
from django.contrib.auth.models import User

RANK_CHOICES = (
    ("مدیریت انبار", "مدیریت انبار"),
    ("مدیریت فروش", "مدیریت فروش"),
    ("مدیریت تولید", "مدیریت تولید"),
    ("مدیریت مالی", "مدیریت مالی"),
    ("مدیر کارخانه", "مدیر کارخانه"),
    ("مسئول خرید", "مسئول خرید"),
)


class Employee(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    department = models.CharField("دپارتمان", max_length=50, choices=RANK_CHOICES, blank=True, null=True)

    class Meta:
        verbose_name_plural = "اطلاعات اضافه"


class Banner(models.Model):
    message = models.TextField(verbose_name='متن')

    class Meta:
        verbose_name_plural = "متن بنر"