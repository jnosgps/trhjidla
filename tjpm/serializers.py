# -*- coding: utf-8 -*-

from shop1.models import Producer, Product, Customer, Member, Order, OrderItem, OrderSubstatus, Category, FoodType
from rest_framework import serializers

class OrderSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Order
        fields = ('customer', 'member', 'order_date', 'delivery_time', 'total_cost')

class CustomerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Customer
        fields = ('name', 'mobile', 'lat', 'lng')

class MemberSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Member
        fields = ('customer', 'login', 'password', 'registered_date', 'last_active', 'address')