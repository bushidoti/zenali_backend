from django.contrib import admin
from rest_framework import routers
from django.urls import path, include
from rest_framework_simplejwt import views as jwt_views
from industrial_warehouse.views import *
from production.views import PendingProduceApi
from sale.views import SaleFactorApi, AutoIncrementSaleFactorApi
from buy.views import ApplyBuyApi
from .views import AutoIncrementApi
from user.views import BannerApi
from consumable_warehouse.views import ConsumableApi, ProductFactorApi, ProductApi, ProductDetailedApi, ProductCheckApi, \
    CategoryApi

router = routers.DefaultRouter()
router.register(r'apply_buy', ApplyBuyApi, 'apply_buy')
router.register(r'sale_factor', SaleFactorApi, 'sale_factor')
router.register(r'raw_material', RawMaterialApi, 'raw_material')
router.register(r'consuming_material', ConsumingMaterialApi, 'consuming_material')
router.register(r'raw_material_detailed', RawMaterialDetailedApi, 'raw_material_detailed')
router.register(r'consuming_material_detailed', ConsumingMaterialDetailedApi, 'consuming_material_detailed')
router.register(r'request_supply', RequestSupplyApi, 'request_supply')
router.register(r'raw_material_factor', RawMaterialFactorApi, 'raw_material_factor')
router.register(r'production', ProductionApi, 'production')
router.register(r'production_check', ProductionCheckApi, 'production_check')
router.register(r'raw_material_check', RawMaterialCheckApi, 'raw_material_check')
router.register(r'consuming_material_factor', ConsumingMaterialFactorApi, 'consuming_material_factor')
router.register(r'consuming_material_check', ConsumingMaterialCheckApi, 'consuming_material_check')
router.register(r'waste', WasteApi, 'waste')
router.register(r'waste_check', WasteCheckApi, 'waste_check')
router.register(r'auto_increment_sale_factor', AutoIncrementSaleFactorApi, 'auto_increment_sale_factor')
router.register(r'pending_produce', PendingProduceApi, 'pending_produce')
router.register(r'consumable', ConsumableApi, 'consumable')
router.register(r'category', CategoryApi, 'category')
router.register(r'product_factor', ProductFactorApi, 'product_factor')
router.register(r'product', ProductApi, 'product')
router.register(r'product_detailed', ProductDetailedApi, 'product_detailed')
router.register(r'product_check', ProductCheckApi, 'product_check')
router.register(r'banner', BannerApi, 'banner')
router.register(r'production_detail', ProductionDetailApi, 'production_detail')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('', include('authentification.urls')),
    path('', include('user.urls')),
    path('auto_increment/<str:table>/', AutoIncrementApi.as_view(), name='auto_increment'),
    path('token/',
         jwt_views.TokenObtainPairView.as_view(),
         name='token_obtain_pair'),
    path('token/refresh/',
         jwt_views.TokenRefreshView.as_view(),
         name='token_refresh'),
]
