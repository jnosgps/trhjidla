from django.conf.urls import url
from django.views.generic import RedirectView

from . import views

urlpatterns = [
	url(r'^$', views.dashboard, name='dashboard'),
	url(r'^login_form/$', views.login_form, name='login_form'),
	url(r'^login/$', views.login, name='login'),
	url(r'^logout/$', views.logout, name='logout'),
]