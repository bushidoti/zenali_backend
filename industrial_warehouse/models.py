from django.db import models
from django_jalali.db import models as jmodels


class RawMaterial(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    name = models.CharField("نام کالا", max_length=100, blank=False, null=True)
    scale = models.CharField("مقیاس", max_length=50, blank=True, null=True)

    class Meta:
        verbose_name_plural = "انبار مواد اولیه"


class RequestSupply(models.Model):
    raw_material_jsonData = models.JSONField("کپسول مواد اولیه", blank=False, null=True)
    consuming_material_jsonData = models.JSONField("کپسول مواد مصرفی", blank=False, null=True)
    applicant = models.CharField("درخواست کننده", max_length=50, blank=True)
    purpose = models.CharField("دلیل", max_length=150, blank=True, null=False)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    is_delivered = models.BooleanField("تحویل شده ؟", blank=True, null=True)
    supplement = models.BooleanField("متمم برای ادامه سفارش ؟", blank=True, null=True)
    which_request = models.CharField("متمم سفارش مربوطه ؟", blank=True, max_length=150, default='', null=True)

    class Meta:
        verbose_name_plural = "درخواست کالا از انبار"


class ProductionCheck(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    checks = models.TextField("فایل باینری حواله", default='', blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام حواله", blank=False, null=True)

    class Meta:
        verbose_name_plural = "حواله های انبار محصول"


class Production(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    name = models.CharField("نام محصول", max_length=100, blank=False, null=True)
    amount = models.FloatField("تعداد", blank=True, null=True)
    cost = models.FloatField("ارزش", blank=True, null=True)
    checkCode = models.ForeignKey(ProductionCheck, on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        verbose_name_plural = "انبار محصول"


class RawMaterialFactor(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    factor = models.TextField("فایل باینری فاکتور", default='', blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام فاکتور", blank=False, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)

    class Meta:
        verbose_name_plural = "فاکتور ها انبار مواد اولیه"


class RawMaterialCheck(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    checks = models.TextField("فایل باینری حواله", default='', blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام حواله", blank=False, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)

    class Meta:
        verbose_name_plural = "حواله های انبار مواد اولیه"


class ConsumingMaterialCheck(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    checks = models.TextField("فایل باینری حواله", default='', blank=True, null=True)
    jsonData_raw = models.JSONField("کپسول اقلام حواله مواد اولیه", blank=False, null=True)
    jsonData_Consumable = models.JSONField("کپسول اقلام حواله مواد مصرفی", blank=False, null=True)

    class Meta:
        verbose_name_plural = "حواله های انبار مواد مصرفی"


class RawMaterialDetailed(models.Model):
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
    ownership = models.CharField("نوع مالکیت", default='', max_length=50, blank=True, null=True)
    document_code = models.CharField("شناسه مدرک", default='', max_length=150, blank=True, null=True)
    product = models.ForeignKey(RawMaterial, on_delete=models.CASCADE, verbose_name="کالای مربوط به")
    factorCode = models.ForeignKey(RawMaterialFactor, on_delete=models.CASCADE, blank=True, null=True)
    checkCode = models.ForeignKey(ConsumingMaterialCheck, on_delete=models.CASCADE, blank=True, null=True)
    request = models.ForeignKey(RequestSupply, on_delete=models.CASCADE, blank=True, null=True, verbose_name="شماره "
                                                                                                             "درخواست")
    amendment = models.TextField("اصلاحیه", default='', blank=True, null=True)
    systemID = models.BigIntegerField("شماره سیستم", blank=True, null=True)

    class Meta:
        verbose_name_plural = "گزراش انبار مواد اولیه"

    def name(self):
        return self.product.name

    def scale(self):
        return self.product.scale

    name.short_description = 'نام کالا'
    scale.short_description = 'مقیاس'


class ConsumingMaterial(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    name = models.CharField("نام کالا", max_length=100, blank=False, null=True)
    scale = models.CharField("مقیاس", max_length=50, blank=True, null=True)

    class Meta:
        verbose_name_plural = "انبار مواد مصرفی"


class ConsumingMaterialFactor(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    factor = models.TextField("فایل باینری فاکتور", default='', blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام فاکتور", blank=False, null=True)

    class Meta:
        verbose_name_plural = "فاکتور های انبار مواد مصرفی"


class ConsumingMaterialDetailed(models.Model):
    consumable = models.CharField("مورد مصرف", default='', max_length=50, blank=True, null=True)
    input = models.FloatField("ورودی", blank=True, null=True)
    carton = models.IntegerField("تعداد کارتن", blank=True, null=True)
    rate = models.FloatField("نرخ", blank=True, null=True)
    amount = models.FloatField("مبلغ", blank=True, null=True)
    average_rate = models.FloatField("ارزش", blank=True, null=True)
    output = models.FloatField("حروجی", blank=True, null=True)
    afterOperator = models.FloatField("موجودی", blank=True, null=True)
    operator = models.CharField("عملیات", default='', max_length=50, blank=True, null=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    buyer = models.CharField("خریدار", default='', max_length=50, blank=True, null=True)
    seller = models.CharField("فروشنده", default='', max_length=50, blank=True, null=True)
    address_seller = models.TextField("آدرس فروشنده", default='', blank=True, null=True)
    seller_national_id = models.CharField("کدملی فروشنده", default='', max_length=50, blank=True, null=True)
    receiver = models.CharField("تحویل گیرنده", default='', max_length=50, blank=True, null=True)
    ownership = models.CharField("نوع مالکیت", default='', max_length=50, blank=True, null=True)
    document_code = models.CharField("شناسه مدرک", default='', max_length=150, blank=True, null=True)
    product = models.ForeignKey(ConsumingMaterial, on_delete=models.CASCADE, verbose_name="کالای مربوط به")
    factorCode = models.ForeignKey(ConsumingMaterialFactor, on_delete=models.CASCADE, blank=True, null=True)
    checkCode = models.ForeignKey(ConsumingMaterialCheck, on_delete=models.CASCADE, blank=True, null=True)
    amendment = models.TextField("اصلاحیه", default='', blank=True, null=True)
    systemID = models.BigIntegerField("شماره سیستم", blank=True, null=True)
    request = models.ForeignKey(RequestSupply, on_delete=models.CASCADE, blank=True, null=True, verbose_name="شماره "
                                                                                                             "درخواست")

    class Meta:
        verbose_name_plural = "گزراش انبار مواد مصرفی"

    def name(self):
        return self.product.name

    def scale(self):
        return self.product.scale

    name.short_description = 'نام کالا'
    scale.short_description = 'مقیاس'
    name.short_description = 'نام کالا'


class WasteCheck(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    checks = models.TextField("فایل باینری حواله", default='', blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام حواله", blank=False, null=True)

    class Meta:
        verbose_name_plural = "حواله های انبار ضایعات"


class Waste(models.Model):
    date = jmodels.jDateField("تاریخ", auto_now_add=True, blank=True, null=True)
    product = models.ForeignKey(RequestSupply, on_delete=models.CASCADE, verbose_name="شماره سفارش مرتبط")
    checkCode = models.ForeignKey(WasteCheck, on_delete=models.CASCADE, blank=True, null=True, verbose_name="کالای "
                                                                                                            "مربوط به")

    class Meta:
        verbose_name_plural = "گزراش انبار ضایعات"
