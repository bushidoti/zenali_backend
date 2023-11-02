from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from django.db import connection


class AutoIncrementApi(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request, table):
        with connection.cursor() as cursor:
            cursor.execute(
                "SELECT `AUTO_INCREMENT` as code  FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = "
                "'{0}';".format(table))
            current = cursor.fetchone()

        content = {'content': current[0]}
        return Response(content)
