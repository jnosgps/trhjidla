# -*- coding: utf-8 -*-

from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse

from .models import Category, Producer, Product, Member, Customer, Order, OrderItem, PageInfo, LabelTag, FoodType
import hashlib
from django.utils import timezone

from .const import katfam, katimg, katimg2, semafor_barva

def tryToGetMember(request):
	member = {}
	m_id = {}
	try:
		m_id = request.session['member_id']
	except KeyError:
		pass
	if m_id:
		member = Member.objects.get(id=m_id)
		member.updateActive()
	
	return member

def tryToGetBasket(request):
	kosik = {
		'polozky': [],
		'soucet': 0,
		'pocet': 0
	}
	productIds = []
	try:
		productIds = request.session['items']
	except KeyError:
		pass
	
	if productIds:
		for pid in productIds:
			try:
				kosik['polozky'].extend(Product.objects.get(id=pid))
			except TypeError:
				kosik['polozky'].append(Product.objects.get(id=pid))
		for polozka in kosik['polozky']:
			kosik['soucet'] += polozka.cost
		kosik['pocet'] = len(kosik['polozky'])
	
	return kosik

def tryToGetAfterBasket(request):
	kosik = {
		'polozky': [],
		'soucet': 0,
		'pocet': 0,
		'cas': {}
	}
	
	productIds = []
	try:
		productIds = request.session['items2']
	except KeyError:
		pass
		
	if productIds:
		for pid in productIds:
			try:
				kosik['polozky'].extend(Product.objects.get(id=pid))
			except TypeError:
				kosik['polozky'].append(Product.objects.get(id=pid))
		for polozka in kosik['polozky']:
			kosik['soucet'] += polozka.cost
		kosik['pocet'] = len(kosik['polozky'])
		try:
			kosik['cas'] = request.session['items2-time']
		except KeyError:
			pass
	
	return kosik
#                                                                                                HOME
def home(request):
	member = tryToGetMember(request)
	kosik = tryToGetBasket(request)
	timekosik = tryToGetAfterBasket(request)
	
	infotext = PageInfo.objects.get().info_text
	
	return render(request, 'shop1/home_view.html', {
		'member': member,
		'kosik': kosik,
		'kosik2': timekosik,
		'infotext': infotext,
	})

#                                                                                                IMPRESSUM
def impressum(request):
	member = tryToGetMember(request)
	kosik = tryToGetBasket(request)
	timekosik = tryToGetAfterBasket(request)
	
	pi = PageInfo.objects.get()
	
	return render(request, 'shop1/impressum_view.html', {
		'member': member,
		'kosik': kosik,
		'kosik2': timekosik,
		'infotext': pi.info_text,
		'pi': pi,
	})

#                                                                                                CHECKOUT
def checkout(request):
	member = tryToGetMember(request)
	kosik = tryToGetBasket(request)
	timekosik = tryToGetAfterBasket(request)
	infotext = PageInfo.objects.get().info_text

	return render(request, 'shop1/checkout_view.html', {
		'member': member,
		'kosik': kosik,
		'kosik2': timekosik,
		'infotext': infotext,
	})

#                                                                                                PRODUCERS LIST
def producers_list(request, kategorie='fastfood', razeni='az'):
	member = tryToGetMember(request)
	kosik = tryToGetBasket(request)
	timekosik = tryToGetAfterBasket(request)
	
	infotext = PageInfo.objects.get().info_text
		
	if razeni == 'az':
		restaurace = Producer.objects.filter(product__category__name=kategorie).order_by('-online', 'name').distinct()
	elif razeni == 'top':
		restaurace = Producer.objects.filter(product__category__name=kategorie).order_by('-online', '-registered_date').distinct()
	else:
		restaurace  = Producer.objects.filter(product__category__name=kategorie).order_by('-online').distinct()
	
	return render(request, 'shop1/producers_list_view.html', {
		'member': member,
		'kosik': kosik,
		'kosik2': timekosik,
		'kategorie_familiar': katfam[kategorie],
		'kategorie_imgsrc': katimg2[kategorie],
		'noimg_src': katimg[kategorie],
		'katkat': kategorie,
		'razeni': razeni,
		'restlist': restaurace,
		'infotext': infotext,
		'semstavy': semafor_barva,
	})

#                                                                                                PRODUCTS LIST
def products_list(request, kategorie='fastfood', razeni='az'):
	member = tryToGetMember(request)
	kosik = tryToGetBasket(request)
	timekosik = tryToGetAfterBasket(request)
	
	infotext = PageInfo.objects.get().info_text
	
	producent = {}
	ptags = {}
	napoje = {}
	ost_kat = {}
	specials = {}
	foodtypes = {}
	
	if razeni == 'az':
		produkty = Product.objects.filter(category__name=kategorie).order_by('name').distinct()
	elif razeni == 'top':
		produkty = Product.objects.filter(category__name=kategorie).order_by('cost').distinct()
	else:
		produkty = Product.objects.filter(category__name=kategorie).filter(producer__pk=razeni).order_by('name').filter(food_type__isnull=True).distinct()
		producent = Producer.objects.get(pk=razeni)
		ptags = LabelTag.objects.filter(product__producer__pk=razeni).distinct()
		napoje = Product.objects.filter(category__name='drinks').filter(producer__pk=razeni).order_by('name').distinct()
		ost_kat = Category.objects.filter(product__producer__pk=razeni).distinct().exclude(name='drinks').exclude(name=kategorie).distinct()
		for ft in FoodType.objects.filter():
			foodtypes[ft.ftype] = ft.name
			specials[ft.ftype] = Product.objects.filter(category__name=kategorie).filter(producer__pk=razeni).distinct().filter(food_type__pk=ft.pk).distinct()
#		if specials:
#			produkty = Product.objects.filter(category__name=kategorie).filter(producer__pk=razeni).order_by('name').exclude(food_type__isnull=True)
#			print produkty
#		print produkty
#		print specials
	
	return render(request, 'shop1/products_list_view.html', {
		'member': member,
		'kosik': kosik,
		'kosik2': timekosik,
		'kategorie_familiar': katfam[kategorie],
		'kategorie_imgsrc': katimg2[kategorie],
		'noimg_src': katimg[kategorie],
		'katfam': katfam,
		'razeni': razeni,
		'prodlist': produkty,
		'producent': producent,
		'napoje': napoje,
		'specials': specials,
		'foodtypes': foodtypes,
		'semstavy': semafor_barva,
		'ptags': ptags,
		'infotext': infotext,
		'ost_kat': ost_kat,
	})

def product_detail(request, pk):
	member = tryToGetMember(request)
	kosik = tryToGetBasket(request)
	timekosik = tryToGetAfterBasket(request)
	
	infotext = PageInfo.objects.get().info_text

	product = Product.objects.get(pk=pk)
	
	return render(request, 'shop1/product_detail_view.html', {
		'member': member,
		'kosik': kosik,
		'kosik2': timekosik,
		'kategorie_familiar': katfam[product.category.name],
		'kategorie_imgsrc': katimg2[product.category.name],
		'noimg_src': katimg[product.category.name],
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
	if 'items' not in request.session:
		items = []
	else:
		items = request.session['items']
	
	items += request.POST['productId']
	request.session['items'] = items
	
	return HttpResponse("Successfully added to cart!")

def cartItemRemove_get(request, pk):
	if 'items' not in request.session:
		return HttpResponse("No cart to remove item from!")
	
	items = request.session['items']
	items.remove(pk)
	request.session['items'] = items
	
	return HttpResponse("Successfully removed from cart!")

def addToCart2_post(request):
	if 'items2' not in request.session:
		items = []
	else:
		items = request.session['items2']
	
	items += request.POST['productId']
	request.session['items2'] = items
	
	return HttpResponse("Successfully added to cart 2!")

def cart2ItemRemove_get(request, pk):
	if 'items2' not in request.session:
		return HttpResponse("No cart 2 to remove item from!")
	
	items = request.session['items2']
	items.remove(pk)
	request.session['items2'] = items
	
	return HttpResponse("Successfully removed from cart 2!")

def cart2UpdateTime_post(request):
	time = request.POST['newtime']
	request.session['items2-time'] = time
	return HttpResponse("Time change successfull!")