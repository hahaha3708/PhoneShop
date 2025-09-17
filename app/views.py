from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import Product, Category
from django.http import JsonResponse
from .models import ProductVariant
# def home(request):
#     new_products = Product.objects.all().order_by('-id')[:12]  # lấy 12 sản phẩm mới nhất
#     return render(request, 'home.html', {'new_products': new_products})
from django.utils import timezone

def home(request):
    news_list = [
        {
            "title": "iPhone 16 ra mắt: chip mới, pin lớn hơn",
            "url": "https://vnexpress.net/iphone-16-ra-mat-chip-moi-pin-lon-hon-4771234.html",
            "source": "VNExpress",
            "thumb": "https://picsum.photos/seed/iphone/120/80",  # demo ảnh chắc chắn hiển thị
            "published_at": timezone.now(),
        },
        {
            "title": "Samsung giới thiệu One UI 6.1 mới",
            "url": "https://genk.vn/samsung-ra-mat-one-ui-6-1-20240912084529582.chn",
            "source": "GenK",
            "thumb": "https://picsum.photos/seed/samsung/120/80",  # demo ảnh
            "published_at": timezone.now(),
        },
        {
            "title": "Top điện thoại đáng mua tháng này",
            "url": "https://tinhte.vn/thread/top-dien-thoai-dang-mua-thang-9-2024.1234567/",
            "source": "Tinh Tế",
            "thumb": "https://picsum.photos/seed/phone/120/80",  # demo ảnh
            "published_at": timezone.now(),
        },
    ]
    ctx = {
        "new_products":  Product.objects.all().order_by('-id')[:12],
        "news_list": news_list,
    }
    return render(request, "home.html", ctx)




def product_list(request):
    products = Product.objects.all()
    categories = Category.objects.all()
    q = request.GET.get('q')
    brand = request.GET.get('brand')
    sort = request.GET.get('sort')

    if q:
        products = products.filter(name__icontains=q)
    if brand:
        products = products.filter(brand__iexact=brand)
    if sort == 'price_asc':
        products = products.order_by('price')
    elif sort == 'price_desc':
        products = products.order_by('-price')

    ctx = {
        'products': products,
        'categories': categories,
        'page_obj': None,  # sau này dùng Paginator
    }
    return render(request, 'products/list.html', ctx)




def product_detail(request, slug):
    from .models import Product
    product = Product.objects.filter(slug=slug).first()
    if not product:
        from django.http import Http404
        raise Http404('Không tìm thấy sản phẩm')
    related = Product.objects.filter(brand=product.brand).exclude(slug=slug)[:4]
    return render(request, 'products/detail.html', {'product': product, 'related': related})


from django.shortcuts import get_object_or_404
from .models import Product, ProductVariant

# def add_to_cart(request):
#     product_id = request.POST.get("product_id")
#     capacity_id = request.POST.get("capacity_id")
#     color_id = request.POST.get("color_id")
#     quantity = int(request.POST.get("quantity", 1))

#     # Kiểm tra variant
#     variant = get_object_or_404(
#         ProductVariant,
#         product_id=product_id,
#         capacity_id=capacity_id,
#         color_id=color_id
#     )

#     cart = request.session.get("cart", {})

#     key = f"{product_id}-{capacity_id}-{color_id}"
#     if key in cart:
#         cart[key]["quantity"] += quantity
#     else:
#         cart[key] = {
#             "product_id": product_id,
#             "name": variant.product.name,
#             "capacity": variant.capacity.value if variant.capacity else "",
#             "color": variant.color.name if variant.color else "",
#             "price": float(variant.price),
#             "quantity": quantity,
#             "image": variant.product.image.url if variant.product.image else "",
#         }

#     request.session["cart"] = cart
#     request.session.modified = True

#     return JsonResponse({"success": True, "cart_count": sum(item["quantity"] for item in cart.values())})
def add_to_cart(request):
    if request.method == "POST":
        product_id = request.POST.get("product_id")
        capacity_id = request.POST.get("capacity_id")
        color_id = request.POST.get("color_id")
        quantity = int(request.POST.get("quantity", 1))

        variant = get_object_or_404(
            ProductVariant,
            product_id=product_id,
            capacity_id=capacity_id,
            color_id=color_id
        )

        cart = request.session.get("cart", {})

        key = f"{product_id}-{capacity_id}-{color_id}"
        if key in cart:
            cart[key]["quantity"] += quantity
        else:
            cart[key] = {
                "name": variant.product.name,
                "capacity": variant.capacity.name if variant.capacity else "",
                "color": variant.color.name if variant.color else "",
                "price": float(variant.price),
                "quantity": quantity,
                "image": variant.product.image if variant.product.image else "",
                "key": key,
            }

        request.session["cart"] = cart
        request.session.modified = True

        return JsonResponse({
            "success": True,
            "cart_count": sum(item["quantity"] for item in cart.values())
        })

    return JsonResponse({"success": False})


# def cart_view(request):
#     # Giỏ hàng mẫu: lấy 2 sản phẩm đầu tiên từ database (nếu có)
#     products = list(Product.objects.all()[:2])
#     items = []
#     if len(products) > 0:
#         items.append({'id': products[0].id, 'name': products[0].name, 'price': products[0].price, 'qty': 1, 'total': products[0].price})
#     if len(products) > 1:
#         items.append({'id': products[1].id, 'name': products[1].name, 'price': products[1].price, 'qty': 2, 'total': 2 * products[1].price})
#     subtotal = sum(i['total'] for i in items)
#     shipping = 30000 if subtotal < 5000000 else 0
#     total = subtotal + shipping
#     return render(request, 'cart/cart.html', {
#         'items': items,
#         'subtotal': subtotal,
#         'shipping': shipping,
#         'total': total,
#     })
from django.views.decorators.http import require_POST

@require_POST
def update_cart(request):
    product_key = request.POST.get("id")  # key lưu trong session (product_id-capacity-color)
    action = request.POST.get("action")   # plus / minus / remove

    cart = request.session.get("cart", {})

    if product_key in cart:
        if action == "plus":
            cart[product_key]["quantity"] += 1
        elif action == "minus":
            cart[product_key]["quantity"] -= 1
            if cart[product_key]["quantity"] <= 0:
                del cart[product_key]
        elif action == "remove":
            del cart[product_key]

    request.session["cart"] = cart
    request.session.modified = True

    # Tính lại tổng
    subtotal = sum(item["price"] * item["quantity"] for item in cart.values())
    shipping = 30000 if subtotal < 5000000 else 0
    total = subtotal + shipping

    return JsonResponse({
        "cart_count": sum(item["quantity"] for item in cart.values()),
        "subtotal": subtotal,
        "shipping": shipping,
        "total": total,
    })

def cart_view(request):
    cart = request.session.get("cart", {})
    items = []
    subtotal = 0
    for key, item in cart.items():
        total = item["price"] * item["quantity"]
        subtotal += total
        items.append({
            **item,
            "total": total
        })
    shipping = 30000 if subtotal < 5000000 else 0
    total = subtotal + shipping
    return render(request, "cart/cart.html", {
        "items": items,
        "subtotal": subtotal,
        "shipping": shipping,
        "total": total,
    })



def checkout_view(request):
    # Giỏ hàng mẫu: lấy 2 sản phẩm đầu tiên từ database (nếu có)
    products = list(Product.objects.all()[:2])
    items = []
    if len(products) > 0:
        items.append({'id': products[0].id, 'name': products[0].name, 'price': products[0].price, 'qty': 1, 'total': products[0].price})
    if len(products) > 1:
        items.append({'id': products[1].id, 'name': products[1].name, 'price': products[1].price, 'qty': 1, 'total': products[1].price})
    subtotal = sum(i['total'] for i in items)
    shipping = 30000 if subtotal < 5000000 else 0
    total = subtotal + shipping
    return render(request, 'checkout/checkout.html', {
        'items': items,
        'subtotal': subtotal,
        'shipping': shipping,
        'total': total,
    })
from django.shortcuts import render, redirect
from django.contrib.auth import login
from .forms import CustomUserCreationForm

def signup(request):
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect("home")   # hoặc 'login'
    else:
        form = CustomUserCreationForm()
    return render(request, "registration/signup.html", {"form": form})

def get_price(request):
    product_id = request.GET.get("product")
    capacity_id = request.GET.get("capacity")
    color_id = request.GET.get("color")

    try:
        variant = ProductVariant.objects.get(
            product_id=product_id,
            capacity_id=capacity_id,
            color_id=color_id
        )
        return JsonResponse({"price": int(variant.price)})
    except ProductVariant.DoesNotExist:
        return JsonResponse({"price": 0})