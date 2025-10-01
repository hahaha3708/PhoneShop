from .models import Category,Product, Accessory

# Cấp dữ liệu dùng chung cho mọi template: danh mục, đếm giỏ hàng.


def common_context(request):
    categories = Category.objects.all()
    cart = request.session.get('cart', {})
    cart_count = sum(item.get('qty', 0) for item in cart.values())

    return {
        'categories': categories,
        'cart_count': cart_count,
    }
def brand_sets(request):
    phone_brands = Product.objects.values_list("brand", flat=True).distinct()
    acc_brands   = Accessory.objects.values_list("brand", flat=True).distinct()

    # Chuẩn hóa (bỏ None, strip khoảng trắng)
    phone_brands = sorted({(b or "").strip() for b in phone_brands if (b or "").strip()})
    acc_brands   = sorted({(b or "").strip() for b in acc_brands if (b or "").strip()})
    all_brands   = sorted(set(phone_brands) | set(acc_brands))

    return {
        "phone_brands": phone_brands,
        "accessory_brands": acc_brands,
        "all_brands": all_brands,
    }
