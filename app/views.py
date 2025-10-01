from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import Product, Category
from django.http import JsonResponse
from .models import ProductVariant
from django.shortcuts import render, get_object_or_404
from django.db.models import Q, Min
from .models import Accessory, AccessoryCategory, AccessoryColor, AccessoryVariant
from itertools import chain
from django.core.paginator import Paginator
from django.db.models import Value, CharField, F, Q
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
    
# phần phụ kiện

def accessory_list(request):
    cat_slug = request.GET.get("cat", "")
    q = request.GET.get("q", "")
    sort = request.GET.get("sort", "")  # price_asc | price_desc | new

    categories = AccessoryCategory.objects.all().order_by("name")

    items = Accessory.objects.all().select_related("category")

    if cat_slug:
        items = items.filter(category__slug=cat_slug)

    if q:
        items = items.filter(
            Q(name__icontains=q) | Q(brand__icontains=q) | Q(specs__icontains=q)
        )

    # Lấy giá hiển thị mặc định = min giá trong các variant (nếu có), còn không thì lấy price
    items = items.annotate(min_variant_price=Min("accessoryvariant__price"))

    if sort == "price_asc":
        items = items.order_by("min_variant_price", "price")
    elif sort == "price_desc":
        items = items.order_by("-min_variant_price", "-price")
    elif sort == "new":
        items = items.order_by("-id")
    else:
        items = items.order_by("name")

    ctx = {
        "categories": categories,
        "items": items,
        "active_cat": cat_slug,
        "q": q,
        "sort": sort,
    }
    return render(request, "products/accessories_list.html", ctx)



def accessory_detail(request, slug):
    acc = get_object_or_404(
        Accessory.objects.select_related("category"),
        slug=slug
    )

    # Lấy toàn bộ màu + biến thể để client đổi giá
    colors = AccessoryColor.objects.filter(accessory=acc).order_by("id")
    variants = AccessoryVariant.objects.filter(accessory=acc).select_related("color")

    # Map {color_id: price}
    color_prices = {v.color_id: int(v.price) for v in variants}

    ctx = {
        "acc": acc,
        "colors": colors,
        "color_prices": color_prices,
        # giá mặc định: nếu có variant → min variant, không có → acc.price
        "default_price": min(color_prices.values()) if color_prices else int(acc.price),
    }
    return render(request, "products/accessory_detail.html", ctx)

# tất cả điện thoại + phụ kiện
# def all_items_list(request):
#     brand = request.GET.get("brand")
#     sort = request.GET.get("sort")

#     # Lấy cả điện thoại + phụ kiện
#     products = list(Product.objects.all())
#     accessories = list(Accessory.objects.all())

#     items = products + accessories

#     # Nếu lọc theo brand
#     if brand:
#         items = [i for i in items if getattr(i, "brand", "").lower() == brand.lower()]

#     # TODO: nếu cần sắp xếp, bạn xử lý tiếp ở đây

#     ctx = {"items": items, "brand": brand}
#     return render(request, "products/all_items_list.html", ctx)
def all_items_list(request):
    q     = (request.GET.get("q") or "").strip()
    brand = (request.GET.get("brand") or "").strip()
    sort  = (request.GET.get("sort") or "").strip()

    # Phones
    phones_qs = (Product.objects
                 .all()
                 .annotate(kind=Value("phone", output_field=CharField()),
                           final_price=F("price"))
                 .values("id", "name", "slug", "brand", "image", "final_price", "kind"))

    # Accessories
    accs_qs = (Accessory.objects
               .all()
               .annotate(kind=Value("accessory", output_field=CharField()),
                         final_price=F("price"))  # nếu bạn có min_variant_price, đổi F("price") -> Coalesce("min_variant_price","price")
               .values("id", "name", "slug", "brand", "image", "final_price", "kind"))

    # Lọc theo từ khóa
    if q:
        phones_qs = phones_qs.filter(name__icontains=q)
        accs_qs   = accs_qs.filter(name__icontains=q)

    # Lọc theo hãng (tất cả hãng từ cả hai loại)
    if brand:
        phones_qs = phones_qs.filter(brand__iexact=brand)
        accs_qs   = accs_qs.filter(brand__iexact=brand)

    # Gom 2 nguồn lại
    items = list(chain(phones_qs, accs_qs))

    # Sắp xếp
    if sort == "price_asc":
        items.sort(key=lambda x: x["final_price"] or 0)
    elif sort == "price_desc":
        items.sort(key=lambda x: x["final_price"] or 0, reverse=True)
    elif sort == "newest":
        items.sort(key=lambda x: x["id"], reverse=True)
    else:
        items.sort(key=lambda x: x["name"].lower())

    # Phân trang
    paginator = Paginator(items, 12)
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)

    ctx = {
        "items": page_obj.object_list,
        "page_obj": page_obj,
        "q": q,
        "brand": brand,
        "sort": sort,
        # dùng all_brands từ context processor để render bộ lọc hãng
    }
    return render(request, "products/all_items_list.html", ctx)