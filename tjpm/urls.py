from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^$', views.producers_list, name='producers_list'),
]