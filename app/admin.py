from django.contrib import admin
from .models import Category, Product, Capacity, Color, ProductVariant

# Register your models here.
admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Capacity)
admin.site.register(Color)
admin.site.register(ProductVariant)
