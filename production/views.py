import django_filters
from rest_framework import viewsets
from rest_framework.exceptions import MethodNotAllowed
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import IsAuthenticated, BasePermission
from .models import PendingProduce
from .serializer import PendingProduceSerializer
from django_filters import rest_framework as df_filters
from django_filters.fields import CSVWidget, MultipleChoiceField


class CustomPageNumberPagination(PageNumberPagination):
    page_size_query_param = 'size'
    page_query_param = 'page'


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


class PendingProduceFilter(django_filters.rest_framework.FilterSet):
    date = django_filters.rest_framework.CharFilter(field_name='date', lookup_expr='exact')
    purpose = django_filters.rest_framework.CharFilter(field_name='purpose', lookup_expr='exact')
    id = django_filters.rest_framework.NumberFilter(field_name='id', lookup_expr='contains')
    request = django_filters.rest_framework.NumberFilter(field_name='request__id', lookup_expr='contains')
    status = MultipleFilter(
        lookup_expr="contains",
        field_name="status",
        widget=CSVWidget
    )

    class Meta:
        model = PendingProduce
        fields = ['id', 'purpose', 'status', 'request', 'date']


class PendingProduceApi(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated, MyPermission]
    perm_slug = "production.pendingproduce"
    pagination_class = CustomPageNumberPagination
    serializer_class = PendingProduceSerializer
    queryset = PendingProduce.objects.all()
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend]
    filterset_class = PendingProduceFilter
