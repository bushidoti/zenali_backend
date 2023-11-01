from rest_framework.response import Response
from rest_framework.views import APIView
from django.db import connection
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


class RawMaterialFilter(django_filters.rest_framework.FilterSet):
    name = django_filters.rest_framework.CharFilter(field_name='name', lookup_expr='contains')
    name_exact = django_filters.rest_framework.CharFilter(field_name='name', lookup_expr='exact')
    code = django_filters.rest_framework.NumberFilter(field_name='code', lookup_expr='contains')

    class Meta:
        model = RawMaterial
        fields = ['code', 'name', 'name_exact']


class RawMaterialApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.rawmaterial"

    serializer_class = RawMaterialSerializer
    queryset = RawMaterial.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = RawMaterialFilter


class ConsumingMaterialFilter(django_filters.rest_framework.FilterSet):
    name = django_filters.rest_framework.CharFilter(field_name='name', lookup_expr='contains')
    name_exact = django_filters.rest_framework.CharFilter(field_name='name', lookup_expr='exact')
    code = django_filters.rest_framework.NumberFilter(field_name='code', lookup_expr='contains')

    class Meta:
        model = RawMaterial
        fields = ['code', 'name', 'name_exact']


class ConsumingMaterialApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.consumingmaterial"

    serializer_class = ConsumingMaterialSerializer
    queryset = ConsumingMaterial.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = ConsumingMaterialFilter


class RawMaterialDetailedFilter(django_filters.rest_framework.FilterSet):
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
    consumable = django_filters.rest_framework.NumberFilter(field_name='consumable', lookup_expr='contains')

    class Meta:
        model = RawMaterialDetailed
        fields = ['id', 'date', 'name', 'seller', 'product_contain', 'amendment', 'consumable',
                  'scale', 'document_code',
                  'document_type',
                  'operator', 'receiver',
                  'buyer',
                  'systemID',
                  'product']


class RawMaterialDetailedApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.rawmaterialdetailed"

    serializer_class = RawMaterialDetailedSerializer
    queryset = RawMaterialDetailed.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = RawMaterialDetailedFilter

    def create(self, request, *args, **kwargs):
        is_many = isinstance(request.data, list)
        if not is_many:
            return super(RawMaterialDetailedApi, self).create(request, *args, **kwargs)
        else:
            serializer = self.get_serializer(data=request.data, many=True)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class ConsumingMaterialDetailedFilter(django_filters.rest_framework.FilterSet):
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
    consumable = django_filters.rest_framework.NumberFilter(field_name='consumable', lookup_expr='contains')

    class Meta:
        model = RawMaterialDetailed
        fields = ['id', 'date', 'name', 'seller', 'product_contain', 'amendment', 'consumable',
                  'scale', 'document_code',
                  'document_type',
                  'operator', 'receiver',
                  'buyer',
                  'systemID',
                  'product']


class ConsumingMaterialDetailedApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.consumingmaterialdetailed"

    serializer_class = RawMaterialDetailedSerializer
    queryset = ConsumingMaterialDetailed.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = ConsumingMaterialDetailedFilter

    def create(self, request, *args, **kwargs):
        is_many = isinstance(request.data, list)
        if not is_many:
            return super(ConsumingMaterialDetailedApi, self).create(request, *args, **kwargs)
        else:
            serializer = self.get_serializer(data=request.data, many=True)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class RequestSupplyApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.requestsupply"

    serializer_class = RequestSupplySerializer
    queryset = RequestSupply.objects.all()

    def create(self, request, *args, **kwargs):
        is_many = isinstance(request.data, list)
        if not is_many:
            return super(RequestSupplyApi, self).create(request, *args, **kwargs)
        else:
            serializer = self.get_serializer(data=request.data, many=True)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class RawMaterialFactorApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.rawmaterialfactor"

    serializer_class = RawMaterialFactorSerializer
    queryset = RawMaterialFactor.objects.all()


class ProductionApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.production"

    serializer_class = ProductionSerializer
    queryset = Production.objects.all()


class ProductionCheckApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.productioncheck"

    serializer_class = ProductionCheckSerializer
    queryset = ProductionCheck.objects.all()


class RawMaterialCheckApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.rawmaterialcheck"

    serializer_class = RawMaterialCheckSerializer
    queryset = RawMaterialCheck.objects.all()


class ConsumingMaterialFactorApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.consumingmaterialfactor"

    serializer_class = ConsumingMaterialFactorSerializer
    queryset = ConsumingMaterialFactor.objects.all()


class ConsumingMaterialCheckApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.consumingmaterialcheck"

    serializer_class = ConsumingMaterialCheckSerializer
    queryset = ConsumingMaterialCheck.objects.all()


class WasteApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.waste"

    serializer_class = WasteSerializer
    queryset = Waste.objects.all()


class WasteCheckApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "industrial_warehouse.wastecheck"

    serializer_class = WasteCheckSerializer
    queryset = WasteCheck.objects.all()


