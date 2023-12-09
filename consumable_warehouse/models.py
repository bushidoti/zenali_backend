from django.db import models
from django_jalali.db import models as jmodels


class Product(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    name = models.CharField("نام کالا", max_length=100, blank=False, null=True)
    category = models.CharField("گروه کالا", max_length=50, blank=True, null=True)
    scale = models.CharField("مقیاس", max_length=50, blank=True, null=True)

    class Meta:
        verbose_name_plural = "انبار مصرفی"


class ProductFactor(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    factor = models.TextField("فایل باینری فاکتور", default='', blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام فاکتور", blank=False, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)

    class Meta:
        verbose_name_plural = "فاکتور های انبار مصرفی"


class ProductCheck(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    checks = models.TextField("فایل باینری حواله", default='', blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام حواله", blank=False, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)

    class Meta:
        verbose_name_plural = "حواله های انبار مصرفی"


class ProductDetailed(models.Model):
    consumable = models.CharField("مورد مصرف", default='', max_length=50, blank=True, null=True)
    input = models.FloatField("ورودی", blank=True, null=True)
    carton = models.IntegerField("تعداد کارتن", blank=True, null=True)
    rate = models.FloatField("نرخ", blank=True, null=True)
    average_rate = models.FloatField("ارزش", blank=True, null=True)
    amount = models.FloatField("مبلغ", blank=True, null=True)
    output = models.FloatField("حروجی", blank=True, null=True)
    afterOperator = models.FloatField("موجودی", blank=True, null=True)
    operator = models.CharField("عملیات", default='', max_length=50, blank=True, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    buyer = models.CharField("خریدار", default='', max_length=50, blank=True, null=True)
    seller = models.CharField("فروشنده", default='', max_length=50, blank=True, null=True)
    address_seller = models.TextField("آدرس فروشنده", default='', blank=True, null=True)
    seller_national_id = models.CharField("کدملی فروشنده", default='', max_length=50, blank=True, null=True)
    receiver = models.CharField("تحویل گیرنده", default='', max_length=50, blank=True, null=True)
    document_type = models.CharField("نوع مدرک", default='', max_length=50, blank=True, null=True)
    document_code = models.CharField("شناسه مدرک", default='', max_length=150, blank=True, null=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name="کالای مربوط به")
    factorCode = models.ForeignKey(ProductFactor, on_delete=models.CASCADE, blank=True, null=True)
    checkCode = models.ForeignKey(ProductCheck, on_delete=models.CASCADE, blank=True, null=True)
    amendment = models.TextField("اصلاحیه", default='', blank=True, null=True)
    systemID = models.BigIntegerField("شماره سیستم", blank=True, null=True)

    class Meta:
        verbose_name_plural = "گزراش انبار مصرفی"

    def name(self):
        return self.product.name

    def scale(self):
        return self.product.scale

    def category(self):
        return self.product.category

    name.short_description = 'نام کالا'
    category.short_description = 'گروه'
    scale.short_description = 'مقیاس'


class Consumable(models.Model):
    value = models.CharField("مقدار", max_length=50, blank=True)

    def __str__(self):
        return self.value

    class Meta:
        verbose_name_plural = "مورد مصرف"


class Category(models.Model):
    value = models.CharField("مقدار", max_length=50, blank=True)

    class Meta:
        verbose_name_plural = "گروه"

    def __str__(self):
        return self.value
