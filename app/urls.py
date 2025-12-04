from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

app_name = 'shop'

urlpatterns = [
    path('signup/', views.signup, name='signup'),
    path('login/', auth_views.LoginView.as_view(template_name='registration/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('forgot-password/', views.forgot_password, name='forgot_password'),
    path('verify-otp/', views.verify_otp, name='verify_otp'),
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
    path("admin-panel/products/add/", views.admin_product_add, name="admin_product_add"),
    path("admin-panel/products/<int:product_id>/edit/", views.admin_product_edit, name="admin_product_edit"),
    path("admin-panel/products/<int:product_id>/delete/", views.admin_product_delete, name="admin_product_delete"),
    path("admin-panel/accessories/", views.admin_accessories, name="admin_accessories"),
    path("admin-panel/accessories/add/", views.admin_accessory_add, name="admin_accessory_add"),
    path("admin-panel/accessories/<int:accessory_id>/edit/", views.admin_accessory_edit, name="admin_accessory_edit"),
    path("admin-panel/accessories/<int:accessory_id>/delete/", views.admin_accessory_delete, name="admin_accessory_delete"),
    path("admin-panel/sales/", views.admin_sales, name="admin_sales"),
    path("admin-panel/inventory/", views.admin_inventory, name="admin_inventory"),
]
