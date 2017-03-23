# -*- coding: utf-8 -*-

from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse

from .models import Category, Producer, Product, Member, Customer, Order, OrderItem, PageInfo
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
	
	order = {}
	try:
		order = request.session['order']
	except KeyError:
		pass
	
	kosik = { 'hodnota': 0, 'pocetPolozek': 0 }
	if order:
		kosik['hodnota'] = order['total_cost']
		kosik['pocetPolozek'] = len(order['items'])
		kosik['polozky'] = order['items']
	infotext = PageInfo.objects.get().info_text
	
	return render(request, 'shop1/home_view.html', {
		'member': member,
		'kosik': kosik,
		'infotext': infotext,
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
	
	order = {}
	try:
		order = request.session['order']
	except KeyError:
		pass
	
	kosik = { 'hodnota': 0, 'pocetPolozek': 0 }
	if order:
		kosik['hodnota'] = order['total_cost']
		kosik['pocetPolozek'] = len(order['items'])
		kosik['polozky'] = order['items']
	pi = PageInfo.objects.get()
	
	return render(request, 'shop1/impressum_view.html', {
		'member': member,
		'kosik': kosik,
		'infotext': pi.info_text,
		'pi': pi,
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
	
	order = {}
	try:
		order = request.session['order']
	except KeyError:
		pass
	
	kosik = { 'hodnota': 0, 'pocetPolozek': 0 }
	if order:
		kosik['hodnota'] = order['total_cost']
		kosik['pocetPolozek'] = len(order['items'])
		kosik['polozky'] = order['items']
	infotext = PageInfo.objects.get().info_text
		
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
		'infotext': infotext,
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
	
	order = {}
	try:
		order = request.session['order']
	except KeyError:
		pass
	
	kosik = { 'hodnota': 0, 'pocetPolozek': 0 }
	if order:
		kosik['hodnota'] = order['total_cost']
		kosik['pocetPolozek'] = len(order['items'])
		kosik['polozky'] = order['items']
	infotext = PageInfo.objects.get().info_text
	
	producent = {}
	
	if razeni == 'az':
		produkty = Product.objects.filter(category__name=kategorie).order_by('name').distinct()
	elif razeni == 'top':
		produkty = Product.objects.filter(category__name=kategorie).order_by('cost').distinct()
	else:
		produkty = Product.objects.filter(category__name=kategorie).filter(producer__pk=razeni).order_by('name').distinct()
		producent = Producer.objects.get(pk=razeni)
	
	return render(request, 'shop1/products_list_view.html', {
		'member': member,
		'kosik': kosik,
		'kategorie_familiar': katfam[kategorie],
		'kategorie_imgsrc': katimg[kategorie],
		'razeni': razeni,
		'prodlist': produkty,
		'producent': producent,
		'infotext': infotext,
	})

def product_detail(request, pk):
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
	
	order = {}
	try:
		order = request.session['order']
	except KeyError:
		pass
	
	kosik = { 'hodnota': 0, 'pocetPolozek': 0 }
	if order:
		kosik['hodnota'] = order['total_cost']
		kosik['pocetPolozek'] = len(order['items'])
		kosik['polozky'] = order['items']
	product = Product.objects.get(pk=pk)
	infotext = PageInfo.objects.get().info_text
	
	return render(request, 'shop1/product_detail_view.html', {
		'member': member,
		'kosik': kosik,
		'kategorie_familiar': katfam[product.category.name],
		'kategorie_imgsrc': katimg[product.category.name],
		'produkt': product,
		'infotext': infotext,
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

def addToCart_post(request):
	if 'order' not in request.session:
		order = {'items': [], 'total_cost': 0}
	else:
		order = request.session['order']
	
	order['items'] += request.POST['productId']
	order['total_cost'] += int(request.POST['productValue'])
	request.session['order'] = order
	
	return HttpResponse("Successfully added to cart!")

def cartItemRemove_get(request, pk):
	if 'order' not in request.session:
		return HttpResponse("No cart to remove item from!")
	
	order = request.session['order']
	i = Product.objects.get(pk=pk)
	order['items'].remove(pk)
	order['total_cost'] -= i.cost
	request.session['order'] = order
	
	return HttpResponse("Successfully removed from cart!")