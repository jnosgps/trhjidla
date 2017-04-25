from django.conf.urls import url, include
from rest_framework import routers
from django.views.generic import RedirectView

from . import views

router = routers.DefaultRouter()
router.register(r'orders', views.OrderViewSet)
#router.register(r'')

urlpatterns = [
	url(r'^$', views.dashboard, name='dashboard'),
	url(r'^login_form/$', views.login_form, name='login_form'),
	url(r'^login/$', views.login, name='login'),
	url(r'^logout/$', views.logout, name='logout'),
	#url(r'^api/orders/get/0/$', views.getOpenedOrders, name='getOpenedOrders')
	url(r'^api/', include(router.urls)),
]