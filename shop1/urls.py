from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^$', views.home, name='home'),
	
	url(r'^producenti/(?P<kategorie>(fastfood|freshfood|sweets|raws|direct))/(?P<razeni>(az|top|on))/$', views.producers_list, name='producers_list'),
	
	url(r'^produkty/(?P<kategorie>(fastfood|freshfood|sweets|raws|direct))/(?P<razeni>((az|top|on)|([0-9]+)))/$', views.products_list, name='products_list'),
	
	url(r'^produkt/(?P<pk>([0-9]+))/$', views.product_detail, name='product_detail'),

	url(r'^checkout/', views.checkout, name='checkout'),
	
	url(r'^algo/$', views.algorythmize_text, name='algorythmize_text'),
	
	url(r'^login/$', views.login_post, name='login_post'),
	url(r'^logout/$', views.logout_post, name='logout_post'),
	
	url(r'^addToCart/$', views.addToCart_post, name='addToCart_post'),
	url(r'^cartItemRemove/(?P<pk>([0-9]+))/$', views.cartItemRemove_get, name='cartItemRemove_get'),
	
	url(r'^addToCart2/$', views.addToCart2_post, name='addToCart2_post'),
	url(r'^cart2ItemRemove/(?P<pk>([0-9]+))/$', views.cart2ItemRemove_get, name='cart2ItemRemove_get'),
	url(r'^cart2UpdateTime/$', views.cart2UpdateTime_post, name='cart2UpdateTime_post'),
	
	url(r'^vize-projektu/$', views.impressum, name='impressum'),
]