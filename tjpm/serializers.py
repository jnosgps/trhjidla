# -*- coding: utf-8 -*-

from shop1.models import Producer, Product, Customer, Member, Order, OrderItem, OrderSubstatus, Category, FoodType
from rest_framework import serializers

class OrderSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Order
        fields = ('customer', 'member', 'order_date', 'delivery_time', 'total_cost')