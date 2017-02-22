# -*- coding: utf-8 -*-

from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse

from .models import Category, Producer, Product, Member, Customer, Order, OrderItem
import hashlib

#                                                                                                HOME
def home(request):
	m_id = {}
	member = {}
	
	try:
		m_id = request.session['member_id']
	except KeyError:
		pass
	
	if m_id:
		member = Member.objects.get(id=m_id)
		member.updateActive()
	
	kosik = { 'hodnota': 1250, 'pocetPolozek': 24 }
	
	return render(request, 'shop1/home_view.html', {
		'member': member,
		'kosik': kosik,
	})

#                                                                                                IMPRESSUM
def impressum(request):
	m_id = {}
	member = {}
	
	try:
		m_id = request.session['member_id']
	except KeyError:
		pass
	
	if m_id:
		member = Member.objects.get(id=m_id)
		member.updateActive()
	
	kosik = { 'hodnota': 1250, 'pocetPolozek': 24 }
	
	return render(request, 'shop1/impressum_view.html', {
		'member': member,
		'kosik': kosik,
	})

#                                                                                                PRODUCERS LIST
def producers_list(request, kategorie='fastfood', razeni='az'):
	m_id = {}
	member = {}
	
	katfam = {
		'fastfood': u'Rychlé občerstvení',
		'freshfood': u'Zdravé jídlo',
		'sweets': u'Zákusky',
		'raws': u'Suroviny',
		'direct': u'Přímý prodej',
	}
	katimg = {
		'fastfood': '/static/img/svg/hamburger.svg',
		'freshfood': '/static/img/svg/fresh-carrot.svg',
		'sweets': '/static/img/svg/cake.svg',
		'raws': '/static/img/svg/cucumber.svg',
		'direct': '/static/img/svg/fresh-carrot.svg',
	}
	
	try:
		m_id = request.session['member_id']
	except KeyError:
		pass
	
	if m_id:
		member = Member.objects.get(id=m_id)
		member.updateActive()
	
	kosik = { 'hodnota': 1250, 'pocetPolozek': 24 }
		
	if razeni == 'az':
		restaurace = Producer.objects.filter(product__category__name=kategorie).order_by('name').distinct()
	elif razeni == 'top':
		restaurace = Producer.objects.filter(product__category__name=kategorie).order_by('registered_date').distinct()
	else:
		restaurace  = Producer.objects.filter(product__category__name=kategorie).order_by('online').distinct()
	
	return render(request, 'shop1/producers_list_view.html', {
		'member': member,
		'kosik': kosik,
		'kategorie_familiar': katfam[kategorie],
		'kategorie_imgsrc': katimg[kategorie],
		'katkat': kategorie,
		'razeni': razeni,
		'restlist': restaurace,
	})

#                                                                                                PRODUCTS LIST
def products_list(request, kategorie='fastfood', razeni='az'):
	m_id = {}
	member = {}
	
	katfam = {
		'fastfood': u'Rychlé občerstvení',
		'freshfood': u'Zdravé jídlo',
		'sweets': u'Zákusky',
		'raws': u'Suroviny',
		'direct': u'Přímý prodej',
	}
	katimg = {
		'fastfood': '/static/img/svg/hamburger.svg',
		'freshfood': '/static/img/svg/fresh-carrot.svg',
		'sweets': '/static/img/svg/cake.svg',
		'raws': '/static/img/svg/cucumber.svg',
		'direct': '/static/img/svg/fresh-carrot.svg',
	}
	
	try:
		m_id = request.session['member_id']
	except KeyError:
		pass
	
	if m_id:
		member = Member.objects.get(id=m_id)
		member.updateActive()
	
	kosik = { 'hodnota': 1250, 'pocetPolozek': 24 }
	
	if razeni == 'az':
		produkty = Product.objects.filter(category__name=kategorie).order_by('name').distinct()
	elif razeni == 'top':
		produkty = Product.objects.filter(category__name=kategorie).order_by('cost').distinct()
	else:
		produkty = Product.objects.filter(category__name=kategorie).filter(producer__pk=razeni).order_by('name').distinct()
	
	return render(request, 'shop1/products_list_view.html', {
		'member': member,
		'kosik': kosik,
		'kategorie_familiar': katfam[kategorie],
		'kategorie_imgsrc': katimg[kategorie],
		'razeni': razeni,
		'prodlist': produkty,
	})

#                                                                                                [POST]	LOGIN
def login_post(request):
	try:
		m = Member.objects.get(login=request.POST['login'])
		if m.password == request.POST['password']:
			request.session['member_id'] = m.id
			m.updateActive()
			return HttpResponse("Successfully logged in")
		else:
			return HttpResponse("Bad credentials")
	except:
		return HttpResponse("Bad credentials")

#                                                                                                [POST]	LOGOUT
def logout_post(request):
	try:
		m = Member.objects.get(id=request.session['member_id'])
		del request.session['member_id']
		m.updateActive()
	except KeyError:
		pass
	
	return HttpResponse("Successfully logged out")

def algorythmize_text(request):
	try:
		return HttpResponse(hashlib.sha256(request.GET['q']).hexdigest())
	except:
		return HttpResponse('error')