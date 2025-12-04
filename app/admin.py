from django.contrib import admin
from .models import Category, Product, Capacity, Color, ProductVariant
from .models import AccessoryCategory, Accessory, AccessoryColor, AccessoryVariant, AccessoryCompatibleProduct
from .models import Banner, Order, OrderItem, Inventory

# Register your models here.
admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Capacity)
admin.site.register(Color)
admin.site.register(ProductVariant)

# phần phụ kiện
admin.site.register(AccessoryCategory)
admin.site.register(Accessory)
admin.site.register(AccessoryColor)
admin.site.register(AccessoryVariant)
admin.site.register(AccessoryCompatibleProduct)

# Admin models
admin.site.register(Banner)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Inventory)
