# -*- coding: utf-8 -*-

#from django import forms
from django.db import models
from django.utils import timezone

class Category(models.Model):
	name = models.CharField(max_length=32)
	description = models.TextField(blank=True, null=True)
	time_param = models.IntegerField(default=0)
	
	def __unicode__(self):
		return self.name

class FoodType(models.Model):
	name = models.CharField(max_length=64)
	position = models.IntegerField(default=0)

	def __unicode__(self):
		return self.name

class Producer(models.Model):
	name = models.CharField(max_length=64)
	address = models.CharField(max_length=64)
	gps_point = models.CharField(max_length=200, default="RA")
	time_param = models.IntegerField(default=0)
	mobile = models.CharField(max_length=9)
	login = models.CharField(max_length=32)
	password = models.CharField(max_length=64)
	registered_date = models.DateTimeField(default=timezone.now)
	last_active = models.DateTimeField(blank=True, null=True)
	online = models.IntegerField(default=0)
	picture = models.ImageField(upload_to='img/producers', blank=True, null=True)
	
	def updateLastActive(self):
		self.last_active = timezone.now()
		self.save()
	
	def goOnline(self):
		self.online = 1
		updateLastActive()
	
	def goOffline(self):
		self.online = 0
		updateLastActive()
	
	def __unicode__(self):
		return self.name

class Product(models.Model):
	name = models.CharField(max_length=64)
	description = models.CharField(max_length=200)
	category = models.ForeignKey('shop1.Category')
	producer = models.ForeignKey('shop1.Producer')
	time_param = models.IntegerField(default=0)
	cost = models.IntegerField(default=0)
	picture = models.ImageField(upload_to='img/products', blank=True, null=True)
	label_tags = models.ManyToManyField('shop1.LabelTag')
	food_type = models.ForeignKey('shop1.FoodType')
	
	def __unicode__(self):
		return self.name

class Customer(models.Model):
	name = models.CharField(max_length=50)
	mobile = models.CharField(max_length=9)
	lat = models.DecimalField(max_digits=10, decimal_places=6, default=0)
	lng = models.DecimalField(max_digits=10, decimal_places=6, default=0)
	
	def __unicode__(self):
		return self.name

class Member(models.Model):
	customer = models.ForeignKey('shop1.Customer')
	login = models.CharField(max_length=32)
	password = models.CharField(max_length=64)
	registered_date = models.DateTimeField(default=timezone.now)
	last_active = models.DateTimeField(blank=True, null=True)
	address = models.CharField(max_length=100)
	
	def updateActive(self):
		self.last_active = timezone.now()
		self.save()
	
	def __unicode__(self):
		return self.customer.name + ' (' + self.login + ')'
		

class Order(models.Model):
	customer = models.ForeignKey('shop1.Customer')
	member = models.ForeignKey('shop1.Member', blank=True, null=True, default=None)
	order_date = models.DateTimeField(default=timezone.now)
	delivery_time = models.DateTimeField()
	total_cost = models.IntegerField(default=0)
	status = models.IntegerField(default=0)
	
	def __unicode__(self):
		total_products = len(OrderItem.objects.filter(order=self.pk))
		registered = ''
		if self.member:
			registered = ' ('+self.member.login+')'
		return self.customer.name + registered + ' [' + str(total_products) + ']'

class OrderItem(models.Model):
	order = models.ForeignKey('shop1.Order')
	product = models.ForeignKey('shop1.Product')
	quantity = models.IntegerField(default=1)
	
	def __unicode__(self):
		return str(self.quantity) + 'x ' + self.product.name

class PageInfo(models.Model):
	info_text = models.TextField()
	impressum1 = models.TextField(blank=True, null=True)
	impressum2 = models.TextField(blank=True, null=True)
	impressum3 = models.TextField(blank=True, null=True)
	impressum4 = models.TextField(blank=True, null=True)
	impressum5 = models.TextField(blank=True, null=True)
	impressum6 = models.TextField(blank=True, null=True)
	impressum7 = models.TextField(blank=True, null=True)
	image1 = models.FileField(upload_to='img/impressum', blank=True, null=True)
	image2 = models.FileField(upload_to='img/impressum', blank=True, null=True)
	image3 = models.FileField(upload_to='img/impressum', blank=True, null=True)
	image4 = models.FileField(upload_to='img/impressum', blank=True, null=True)
	image5 = models.FileField(upload_to='img/impressum', blank=True, null=True)
	image6 = models.FileField(upload_to='img/impressum', blank=True, null=True)
	image7 = models.FileField(upload_to='img/impressum', blank=True, null=True)

class LabelTag(models.Model):
	label = models.CharField(max_length=64)

	def __unicode__(self):
		return self.label