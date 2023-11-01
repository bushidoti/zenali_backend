from rest_framework.response import Response

from .serializer import *
from .models import *
import django_filters
from rest_framework import viewsets, status
from rest_framework.exceptions import MethodNotAllowed
from rest_framework.permissions import IsAuthenticated
from rest_framework.permissions import BasePermission
from django_filters.fields import CSVWidget, MultipleChoiceField
from django_filters import rest_framework as df_filters


class MyPermission(BasePermission):
    message = "دسترسی لازم را ندارید."
    permission_map = {
        "GET": "{app_label}.view_{model_name}",
        "POST": "{app_label}.add_{model_name}",
        "PUT": "{app_label}.change_{model_name}",
        "PATCH": "{app_label}.change_{model_name}",
        "DELETE": "{app_label}.delete_{model_name}",
    }

    def _get_permission(self, method, perm_slug):
        app, model = perm_slug.split(".")
        if method not in self.permission_map:
            raise MethodNotAllowed(method)
        perm = self.permission_map.get(method).format(app_label=app, model_name=model)
        return perm

    def has_permission(self, request, view):
        perm = self._get_permission(
            method=request.method, perm_slug=view.perm_slug
        )
        if request.user.has_perm(perm):
            return True
        return False


class MultipleField(MultipleChoiceField):
    def valid_value(self, value):
        return True


class MultipleFilter(df_filters.MultipleChoiceFilter):
    field_class = MultipleField


class ProductFilter(django_filters.rest_framework.FilterSet):
    name = django_filters.rest_framework.CharFilter(field_name='name', lookup_expr='contains')
    name_exact = django_filters.rest_framework.CharFilter(field_name='name', lookup_expr='exact')
    code = django_filters.rest_framework.NumberFilter(field_name='code', lookup_expr='contains')
    category = MultipleFilter(
        lookup_expr="contains",
        field_name="category",
        widget=CSVWidget
    )

    class Meta:
        model = Product
        fields = ['code', 'name', 'name_exact', 'category']


class ProductApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "consumable_warehouse.product"

    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = ProductFilter


class ProductDetailedFilter(django_filters.rest_framework.FilterSet):
    date = django_filters.rest_framework.CharFilter(field_name='date', lookup_expr='exact')
    scale = django_filters.rest_framework.CharFilter(field_name='scale', lookup_expr='contains')
    buyer = django_filters.rest_framework.CharFilter(field_name='buyer', lookup_expr='contains')
    name = django_filters.rest_framework.CharFilter(field_name='product__name', lookup_expr='contains')
    amendment = django_filters.rest_framework.CharFilter(field_name='amendment', lookup_expr='contains')
    receiver = django_filters.rest_framework.CharFilter(field_name='receiver', lookup_expr='contains')
    seller = django_filters.rest_framework.CharFilter(field_name='seller', lookup_expr='contains')
    document_code = django_filters.rest_framework.CharFilter(field_name='document_code', lookup_expr='contains')
    document_type = django_filters.rest_framework.CharFilter(field_name='document_type', lookup_expr='contains')
    id = django_filters.rest_framework.CharFilter(field_name='id', lookup_expr='exact')
    systemID = django_filters.rest_framework.NumberFilter(field_name='systemID', lookup_expr='exact')
    operator = MultipleFilter(
        lookup_expr="contains",
        field_name="operator",
        widget=CSVWidget
    )
    product = django_filters.rest_framework.NumberFilter(field_name='product', lookup_expr='exact')
    product_contain = django_filters.rest_framework.NumberFilter(field_name='product__code', lookup_expr='contains')
    consumable = MultipleFilter(
        lookup_expr="contains",
        field_name="consumable",
        widget=CSVWidget
    )
    category = MultipleFilter(
        lookup_expr="contains",
        field_name="product__category",
        widget=CSVWidget
    )

    class Meta:
        model = ProductDetailed
        fields = ['id', 'date', 'name', 'seller', 'category', 'product_contain', 'amendment', 'consumable',
                  'scale', 'document_code',
                  'document_type',
                  'operator', 'receiver',
                  'buyer',
                  'systemID',
                  'product']


class ProductDetailedApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "consumable_warehouse.productdetailed"

    serializer_class = ProductDetailedSerializer
    queryset = ProductDetailed.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = ProductDetailedFilter

    def create(self, request, *args, **kwargs):
        is_many = isinstance(request.data, list)
        if not is_many:
            return super(ProductDetailedApi, self).create(request, *args, **kwargs)
        else:
            serializer = self.get_serializer(data=request.data, many=True)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class ProductFactorApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "consumable_warehouse.productfactor"

    serializer_class = ProductFactorSerializer
    queryset = ProductFactor.objects.all()


class ProductCheckApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "consumable_warehouse.productcheck"

    serializer_class = ProductCheckSerializer
    queryset = ProductCheck.objects.all()


class ConsumableApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated,]

    serializer_class = ConsumableSerializer
    queryset = Consumable.objects.all()


class CategoryApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated,]

    serializer_class = CategorySerializer
    queryset = Category.objects.all()
