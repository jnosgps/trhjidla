# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.core.serializers import serialize

from shop1.models import Producer, Order, OrderItem, OrderSubstatus, Product, Customer, Member

from rest_framework import viewsets
from tjpm.serializers import OrderSerializer, CustomerSerializer, MemberSerializer

def getProducer(request):
	p = {}
	try:
		p = Producer.objects.get(id=request.session['producer_id'])
		p.updateLastActive()
	except:
		return 0
	
	if p:
		try:
			del request.session['message']
		except:
			pass

	return p

def dashboard(request):
	p = getProducer(request)
	if not p:
		return login_form(request)
	
	objednavky = []
	orders = Order.objects.filter(orderitem__product__producer__pk=p.pk).distinct().filter(status=0)
	if orders:
		for o in orders:
			orderitems = OrderItem.objects.filter(order__pk=o.pk).distinct()
			objednavka = {
				'objednavka': o,
				'polozky': []
			}
			for oi in orderitems:
				try:
					objednavka['polozky'].extend(oi)
				except TypeError:
					objednavka['polozky'].append(oi)
			print objednavka
			try:
				objednavky.extend(objednavka.copy())
			except TypeError:
				objednavky.append(objednavka.copy())
	
	print objednavky
	return render(request, 'tjpm/dashboard.html', {
		'producent': p,
		'objednavky': objednavky,
	})

def login_form(request):
		return render(request, 'tjpm/login.html')

def login(request):
	p = {}
	
	try:
		p = Producer.objects.get(login=request.POST['login'])
		if p.password == request.POST['password']:
			request.session['producer_id'] = p.id
			p.updateLastActive()
			return HttpResponse("Successfully logged in")
		else:
			return HttpResponse("Bad credentials")
	except:
		return HttpResponse("Bad credentials")

def logout(request):
	try:
		p = Producer.objects.get(id=request.session['producer_id'])
		del request.session['producer_id']
		p.updateLastActive()
	except KeyError:
		pass
	
	return HttpResponse("Successfully logged out")

def getOpenedOrders(request):
    producent = getProducer(request)
    if not producent:
        return HttpResponse('You are not a producer!')
    
    objednavky = []
    open_orders = Order.objects.filter(ordersubstatus__producer__pk=producent.pk).distinct().filter(ordersubstatus__status=0).distinct()
    if open_orders:
        for order in open_orders:
            items_order = OrderItem.objects.filter(order__pk=order.pk).distinct().filter(product__producer__pk=producent.pk).distinct()

            objednavka = {}
            objednavka['order'] = serialize('json', order)
            objednavka['substatus'] = serialize('json', OrderSubstatus.objects.get(order__pk=order.pk, producer__pk=producent.pk))
            objednavka['polozky'] = []
            
            for oi_items_order in items_order:
                objednavka['polozky'] += [serialize('json', oi_items_order)]
            
            objednavky += [objednavka]
	
	return JsonResponse({'objednavky':objednavky}, safe=False)

class OrderViewSet(viewsets.ModelViewSet):
	"""
	API endpoint C[R][U]D Order
	"""
	queryset = Order.objects.filter(ordersubstatus__producer__id=1).distinct().filter(ordersubstatus__status=0).distinct()
	serializer_class = OrderSerializer

class CustomerViewSet(viewsets.ModelViewSet):
	"""
	API endpoint C[R][U]D Customer
	"""
	queryset = Customer.objects.all()
	serializer_class = CustomerSerializer

class MemberViewSet(viewsets.ModelViewSet):
	"""
	API endpoint C[R][U]D Order
	"""
	queryset = Member.objects.all()
	serializer_class = MemberSerializer