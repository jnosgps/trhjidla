from django.contrib import admin
from .models import Category, Producer, Product, Customer, Member, Order, OrderItem, OrderSubstatus, PageInfo, LabelTag, FoodType, ProducerRating, ProductRating

admin.site.register(Category)
admin.site.register(Producer)
admin.site.register(Product)
admin.site.register(Customer)
admin.site.register(Member)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(OrderSubstatus)
admin.site.register(PageInfo)
admin.site.register(LabelTag)
admin.site.register(FoodType)
admin.site.register(ProducerRating)
admin.site.register(ProductRating)