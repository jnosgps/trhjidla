from django.shortcuts import render

from shop1.models import Producer

def producers_list(request):
	producers = Producer.objects.all().order_by('registered_date')
	return render(request, 'tjpm/producers_list.html', {
		'producers': producers
	})

