from django.urls import path
from . import views

app_name = 'shop'

urlpatterns = [
    path('signup/', views.signup, name='signup'),
    path('', views.home, name='home'),
    path('products/', views.product_list, name='product_list'),
    path('products/<slug:slug>/', views.product_detail, name='product_detail'),
    path('cart/', views.cart_view, name='cart'),
    path('checkout/', views.checkout_view, name='checkout'),
    path("api/get-price/", views.get_price, name="get_price"),

    # 🛒 giỏ hàng
    path("cart/add/", views.add_to_cart, name="add_to_cart"),
    path("cart/update/", views.update_cart, name="update_cart"),

     # Accessories
    path("accessories/", views.accessory_list, name="accessory_list"),
    path("accessories/<slug:slug>/", views.accessory_detail, name="accessory_detail"),

    # All items (phones + accessories)
    path("all-items/", views.all_items_list, name="all_items_list"),

    # Admin panel
    path("admin-panel/dashboard/", views.admin_dashboard, name="admin_dashboard"),
    path("admin-panel/products/", views.admin_products, name="admin_products"),
    path("admin-panel/banners/", views.admin_banners, name="admin_banners"),
    path("admin-panel/sales/", views.admin_sales, name="admin_sales"),
    path("admin-panel/inventory/", views.admin_inventory, name="admin_inventory"),
]
