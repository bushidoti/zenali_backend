import django_filters
from rest_framework import viewsets, status
from rest_framework.exceptions import MethodNotAllowed
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated, BasePermission
from django_filters import rest_framework as df_filters
from rest_framework.response import Response

from .serializer import *
from .models import *
from django_filters.fields import CSVWidget, MultipleChoiceField


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


class CustomPageNumberPagination(PageNumberPagination):
    page_size_query_param = 'size'
    page_query_param = 'page'


class MultipleField(MultipleChoiceField):
    def valid_value(self, value):
        return True


class MultipleFilter(df_filters.MultipleChoiceFilter):
    field_class = MultipleField


class FactorPropertyApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "property.factorproperty"
    serializer_class = FactorPropertySerializer
    queryset = FactorProperty.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_fields = ['inventory']


class PropertyFilter(django_filters.rest_framework.FilterSet):
    name = django_filters.rest_framework.CharFilter(field_name='name', lookup_expr='contains')
    property_number = django_filters.rest_framework.CharFilter(field_name='property_number', lookup_expr='contains')
    user = django_filters.rest_framework.CharFilter(field_name='user', lookup_expr='contains')
    using_location = django_filters.rest_framework.CharFilter(field_name='using_location', lookup_expr='contains')
    document_code = django_filters.rest_framework.CharFilter(field_name='document_code', lookup_expr='contains')
    number = django_filters.rest_framework.CharFilter(field_name='number', lookup_expr='contains')
    name_exact = django_filters.rest_framework.CharFilter(field_name='name', lookup_expr='exact')
    year_buy = django_filters.rest_framework.CharFilter(field_name='year_buy', lookup_expr='exact')
    dst_inventory = django_filters.rest_framework.CharFilter(field_name='dst_inventory', lookup_expr='exact')
    inventory = MultipleFilter(
        lookup_expr="contains",
        field_name="inventory",
        widget=CSVWidget
    )
    category = MultipleFilter(
        lookup_expr="contains",
        field_name="category",
        widget=CSVWidget
    )

    type_furniture = MultipleFilter(
        lookup_expr="contains",
        field_name="type_furniture",
        widget=CSVWidget
    )
    factorCode = django_filters.rest_framework.NumberFilter(field_name='factorCode__code', lookup_expr='contains')
    factorCode_exact = django_filters.rest_framework.NumberFilter(field_name='factorCode', lookup_expr='exact')
    movement_status = django_filters.rest_framework.CharFilter(field_name='movement_status', lookup_expr='exact')
    code = django_filters.rest_framework.NumberFilter(field_name='code', lookup_expr='contains')
    model = django_filters.rest_framework.CharFilter(field_name='model', lookup_expr='contains')
    install_location = django_filters.rest_framework.CharFilter(field_name='install_location', lookup_expr='contains')
    year_made = django_filters.rest_framework.CharFilter(field_name='year_made', lookup_expr='contains')
    owner = django_filters.rest_framework.CharFilter(field_name='owner', lookup_expr='contains')
    use_for = django_filters.rest_framework.CharFilter(field_name='use_for', lookup_expr='contains')

    class Meta:
        model = Property
        fields = ['code', 'movement_status', 'name', 'user', 'using_location', 'number', 'type_furniture', 'year_made',
                  'owner', 'use_for',
                  'year_buy', 'install_location', 'document_code', 'category',
                  'dst_inventory', 'factorCode', 'factorCode_exact', 'model', 'property_number',
                  'inventory', 'name_exact']


class PropertyApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "property.property"
    pagination_class = CustomPageNumberPagination
    serializer_class = PropertySerializer
    queryset = Property.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = PropertyFilter

    def create(self, request, *args, **kwargs):
        is_many = isinstance(request.data, list)
        if not is_many:
            return super(PropertyApi, self).create(request, *args, **kwargs)
        else:
            serializer = self.get_serializer(data=request.data, many=True)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class RepairedPropertyApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "property.repairedproperty"
    serializer_class = RepairedPropertySerializer
    queryset = RepairedProperty.objects.all()

    def create(self, request, *args, **kwargs):
        is_many = isinstance(request.data, list)
        if not is_many:
            return super(RepairedPropertyApi, self).create(request, *args, **kwargs)
        else:
            serializer = self.get_serializer(data=request.data, many=True)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
