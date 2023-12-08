from django.db import models


class FactorProperty(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    factor_type = models.CharField("نوع فاکتور", max_length=50, blank=True, null=True)
    factor = models.TextField("فایل باینری فاکتور", default='', blank=True, null=True)
    jsonData = models.JSONField("کپسول اقلام فاکتور", blank=False, null=True)

    class Meta:
        verbose_name_plural = "فاکتور ها"


class Property(models.Model):
    code = models.AutoField("کد ثبت", primary_key=True, unique=True)
    category = models.CharField("دسته بندی", default='', max_length=100, blank=True, null=True)
    name = models.CharField("نام اموال", default='', max_length=100, blank=True, null=True)
    property_number = models.CharField("شماره اموال", default='', max_length=100, blank=True, null=True)
    model = models.CharField("مدل", default='', max_length=50, blank=True, null=True)
    sub_item_type = models.CharField("نوع آیتم زیر مجموعه", default='', max_length=50, blank=True, null=True)
    user = models.CharField("یوزر", default='', max_length=50, blank=True, null=True)
    using_location = models.CharField("محل مورد استفاده", default='', max_length=50, blank=True, null=True)
    document_code = models.CharField("شناسه فاکتور", default='', max_length=50, blank=True, null=True)
    factorCode = models.ForeignKey(FactorProperty, default='', on_delete=models.CASCADE, blank=True, null=True)
    number = models.CharField("شماره خط", default='', max_length=50, blank=True, null=True)
    year_buy = models.CharField("سال خرید", default='', max_length=4, blank=True, null=True)
    phone_feature = models.CharField("ویژگی تلفن", default='', max_length=50, blank=True, null=True)
    cpu = models.CharField("پردازنده", max_length=50, default='', blank=True, null=True)
    motherboard = models.CharField("مادربرد", default='', max_length=50, blank=True, null=True)
    ram = models.CharField("رم", max_length=50, default='', blank=True, null=True)
    power = models.CharField("پاور", max_length=50, default='', blank=True, null=True)
    hdd = models.CharField("هارد", max_length=50, default='', blank=True, null=True)
    case = models.CharField("کیس", max_length=50, default='', blank=True, null=True)
    install_location = models.CharField("محل نصب", default='', max_length=50, blank=True, null=True)
    type_furniture = models.CharField("نوع اثاث", default='', max_length=50, blank=True, null=True)
    year_made = models.CharField("سال ساخت", default='', max_length=4, blank=True, null=True)
    owner = models.CharField("مالک", max_length=50, default='', blank=True, null=True)
    part1plate = models.CharField('چپ', max_length=2, default='', blank=True, null=True)
    part2plate = models.CharField('راست', max_length=25, default='', blank=True, null=True)
    part3plate = models.CharField('سریال', max_length=3, default='', blank=True, null=True)
    cityPlate = models.CharField('شهر', max_length=10, default='', blank=True, null=True)
    motor = models.CharField('شماره موتور', default='', max_length=50, blank=True, null=True)
    chassis = models.CharField('شماره شاسی', default='', max_length=50, blank=True, null=True)
    use_for = models.CharField('مورد استفاده', default='', max_length=50, blank=True, null=True)
    movement_description = models.TextField('شرح وضعیت انتقال', default='', max_length=50, blank=True, null=True)
    description = models.TextField('شرح', default='', max_length=500, blank=True, null=True)
    movement_status = models.CharField('وضعیت انتقال', default='', max_length=50, blank=True, null=True)
    movement_message = models.CharField('پیغام انتقال', default='', max_length=50, blank=True, null=True)
    last_handling_result = models.TextField('آخرین وضعیت بازرسی', default='', max_length=500, blank=True, null=True)
    last_handling_date = models.CharField('آخرین تاریخ بازرسی', default='', max_length=50, blank=True, null=True)
    yearly_handling = models.CharField('سال بازرسی', default='', max_length=4, blank=True, null=True)

    class Meta:
        verbose_name_plural = "اموال"


class RepairedProperty(models.Model):
    factorCode = models.ForeignKey(FactorProperty, on_delete=models.CASCADE, blank=True, null=True)
    property = models.ForeignKey(Property, on_delete=models.CASCADE, blank=True, null=True)
    type = models.TextField('نوع تعمیر', default='', max_length=500, blank=True, null=True)
    description = models.TextField('شرح', default='', max_length=500, blank=True, null=True)
    document_code = models.CharField("شناسه فاکتور", default='', max_length=50, blank=True, null=True)
    kilometer = models.CharField("کیلومتر", default='', max_length=50, blank=True, null=True)
    year_change = models.CharField("سال تعویض", default='', max_length=50, blank=True, null=True)

    class Meta:
        verbose_name_plural = "تعمیرات اموال"
