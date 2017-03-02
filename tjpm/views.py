# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.http import HttpResponse

from shop1.models import Producer

def dashboard(request):
	p = {}
	try:
		p = Producer.objects.get(id=request.session['producer_id'])
		p.updateLastActive()
	except:
		return login_form(request, 'except v db')
	
	if p:
		return render(request, 'tjpm/base.html', {
			'producent': p,
		})
	else:
		return login_form(request, 'chyba v if')

def login_form(request, message=''):
	return render(request, 'tjpm/login.html', {'message:', message})

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
