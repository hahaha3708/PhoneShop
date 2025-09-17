from .models import Category

# Cấp dữ liệu dùng chung cho mọi template: danh mục, đếm giỏ hàng.


def common_context(request):
    categories = Category.objects.all()
    cart = request.session.get('cart', {})
    cart_count = sum(item.get('qty', 0) for item in cart.values())

    return {
        'categories': categories,
        'cart_count': cart_count,
    }