# -*- coding: utf-8 -*-

#from django import forms
from django.db import models
from django.utils import timezone

class Wallet(models.Model):
	driver = models.ForeignKey('dat.Driver')
	got = models.IntegerField(default=0)
	given = models.IntegerField(default=0)
	started_date = models.DateTimeField(default=timezone.now())
	last_update = models.DateTimeField(default=timezone.now())
	
	def deposit(self, amount):
		self.got += amount
		self.last_update = timezone.now()
		self.save()
	
	def withdraw(self, amount):
		self.given += amount
		self.last_update = timezone.now()
		self.save()
	
	def __unicode__(self):
		return '[' + (self.got - self.given) + 'kč]' + self.driver.name + ' - ' + self.started_date

class Driver(models.Model):
	login = models.CharField(max_length=32)
	password = models.CharField(max_length=64)
	name = models.CharField(max_length=64)
	lat = models.DecimalField(max_digits=10, decimal_places=6, default=0)
	lng = models.DecimalField(max_digits=10, decimal_places=6, default=0)
	registered_date = models.DateTimeField(default=timezone.now())
	last_active = models.DateTimeField(blank=True, null=True)
	status = models.IntegerField(default=0)
	level = models.IntegerField(default=0)
	
	def updateLocation(self, lat, lng):
		self.lat = lat
		self.lng = lng
		self.last_active = timezone.now()
		self.save()
	
	def changeStatus(self, status):
		self.status = status
		self.last_active = timezone.now()
		self.save()
	
	def __unicode__(self):
		return self.name + '[' + login + ']'