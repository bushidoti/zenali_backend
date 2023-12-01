import django_filters
from .serializer import SaleFactorSerializer
from .models import SaleFactor
from rest_framework import viewsets
from rest_framework.exceptions import MethodNotAllowed
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated, BasePermission


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


class SaleFactorFilter(django_filters.rest_framework.FilterSet):
    date = django_filters.rest_framework.CharFilter(field_name='date', lookup_expr='exact')
    code = django_filters.rest_framework.NumberFilter(field_name='code', lookup_expr='contains')

    class Meta:
        model = SaleFactor
        fields = ['code', 'date']


class SaleFactorApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "sale.salefactor"
    pagination_class = CustomPageNumberPagination
    serializer_class = SaleFactorSerializer
    queryset = SaleFactor.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = SaleFactorFilter

