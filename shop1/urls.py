from django.conf.urls import url
from . import views

urlpatterns = [
	#url(r'^$', views.category_list, name='category_list'),
	url(r'^$', views.home, name='home'),
	url(r'^producenti/(?P<kategorie>(fastfood|freshfood|sweets|raws|direct))/(?P<razeni>(az|top|on))/$', views.producers_list, name='producers_list'),
	url(r'^produkty/(?P<kategorie>(fastfood|freshfood|sweets|raws|direct))/(?P<razeni>((az|top|on)|([0-9]+)))/$', views.products_list, name='products_list'),
	url(r'^produkt/(?P<pk>([0-9]+))/$', views.product_detail, name='product_detail'),
	#url(r'^kategorie/(?P<pk>[0-9]+)/$', views.category_detail, name='category_detail'),
	url(r'^algo/$', views.algorythmize_text, name='algorythmize_text'),
	url(r'^login/$', views.login_post, name='login_post'),
	url(r'^logout/$', views.logout_post, name='logout_post'),
	url(r'^vize-projektu/$', views.impressum, name='impressum'),
]