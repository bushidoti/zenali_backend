from django.urls import path
from . import views

urlpatterns = [
    path('auto_increment/<str:table>/' ,views.AutoIncrementApi.as_view(), name='auto_increment')
]
