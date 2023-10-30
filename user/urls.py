from django.urls import path
from . import views

urlpatterns = [
    path('permission/', views.PermissionView.as_view(), name='permission'),
    path('name/', views.FullNameView.as_view(), name='name'),
    path('department/', views.DepartmentView.as_view(), name='department'),

]
