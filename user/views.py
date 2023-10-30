from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User
from django.contrib.auth.models import Permission
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth.models import Group
from user.models import Employee

from user.serializer import UserSerializer


class UserApi(viewsets.ModelViewSet):
    permission_classes = (IsAuthenticated,)

    serializer_class = UserSerializer
    queryset = User.objects.all()


class PermissionView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        group_ids = Group.objects.all().values_list('id', flat=True)
        perm_tuple = [x.name for x in Permission.objects.filter(group__id__in=group_ids)]
        content = {'message': perm_tuple}
        return Response(content)


class FullNameView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        content = {'message': request.user.get_full_name()}
        return Response(content)


class DepartmentView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        result = Employee.objects.filter(user=request.user.id)
        content = {'message': result[0].department}
        return Response(content)
