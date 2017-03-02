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
		request.session['message'] = 'except v db'
		return login_form(request)
	
	if p:
		try:
			del request.session['message']
		except:
			pass

		return render(request, 'tjpm/base.html', {
			'producent': p,
		})
	else:
		request.session['message'] = 'chyba v if'
		return login_form(request)

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
