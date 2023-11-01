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
        permissions = Permission.objects.filter(user=request.user)
        group_permissions = Permission.objects.filter(group__user=request.user)

        perm_tuple = [x.name for x in group_permissions]
        content = {'content': perm_tuple}
        return Response(content)


class FullNameView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        content = {'content': self.request.user.get_full_name()}
        return Response(content)


class DepartmentView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        result = Employee.objects.filter(user=self.request.user.id)
        content = {'content': result[0].department}
        return Response(content)
