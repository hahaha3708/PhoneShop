from django.core.management.base import BaseCommand
from app.models import Category, Product, Capacity, Color, ProductVariant, Inventory

class Command(BaseCommand):
    help = "Thêm dữ liệu mẫu cho sản phẩm (khoảng 30 sản phẩm)"

    def handle(self, *args, **kwargs):
        # Tạo categories nếu chưa có
        categories = ['Smartphone', 'Tablet', 'Laptop']
        for cat_name in categories:
            cat, created = Category.objects.get_or_create(
                name=cat_name,
                defaults={'slug': cat_name.lower()}
            )
            if created:
                self.stdout.write(f"Tạo category: {cat_name}")

        smartphone_cat = Category.objects.get(name='Smartphone')

        # Dữ liệu mẫu cho sản phẩm (khoảng 30 cái)
        products_data = [
            {'name': 'iPhone 15 Pro', 'brand': 'Apple', 'price': 29990000, 'image': 'https://example.com/iphone15pro.jpg'},
            {'name': 'iPhone 15 Pro Max', 'brand': 'Apple', 'price': 34990000, 'image': 'https://example.com/iphone15promax.jpg'},
            {'name': 'Samsung Galaxy S24 Ultra', 'brand': 'Samsung', 'price': 31990000, 'image': 'https://example.com/samsungs24ultra.jpg'},
            {'name': 'Samsung Galaxy Z Fold 5', 'brand': 'Samsung', 'price': 41990000, 'image': 'https://example.com/samsunggalaxyZfold5.jpg'},
            {'name': 'Google Pixel 8 Pro', 'brand': 'Google', 'price': 24990000, 'image': 'https://example.com/googlepixel8pro.jpg'},
            {'name': 'Google Pixel 7a', 'brand': 'Google', 'price': 14990000, 'image': 'https://example.com/GooglePixel7a.jpg'},
            {'name': 'Xiaomi 14', 'brand': 'Xiaomi', 'price': 19990000, 'image': 'https://example.com/Xiaomi14.jpg'},
            {'name': 'Xiaomi 14 Pro', 'brand': 'Xiaomi', 'price': 22990000, 'image': 'https://example.com/xiaomi14pro.jpg'},
            {'name': 'Oppo Find X7', 'brand': 'Oppo', 'price': 29990000, 'image': 'https://example.com/oppofindx7.jpg'},
            {'name': 'Oppo Reno 10 Pro', 'brand': 'Oppo', 'price': 17990000, 'image': 'https://example.com/opporeno10pro.webp'},
            {'name': 'iPhone 14', 'brand': 'Apple', 'price': 22990000, 'image': 'https://example.com/iphone14.jpg'},
            {'name': 'iPhone 14 Pro', 'brand': 'Apple', 'price': 27990000, 'image': 'https://example.com/iphone14pro.jpg'},
            {'name': 'Samsung Galaxy S23', 'brand': 'Samsung', 'price': 24990000, 'image': 'https://example.com/samsunggalaxys23.jpg'},
            {'name': 'Samsung Galaxy A54', 'brand': 'Samsung', 'price': 12990000, 'image': 'https://example.com/samsunggalaxya54.jpg'},
            {'name': 'Google Pixel 8', 'brand': 'Google', 'price': 19990000, 'image': 'https://example.com/googlepixel8.jpg'},
            {'name': 'Google Pixel 7', 'brand': 'Google', 'price': 17990000, 'image': 'https://example.com/googlepixel7.jpg'},
            {'name': 'Xiaomi 13', 'brand': 'Xiaomi', 'price': 16990000, 'image': 'https://example.com/xiaomi13.jpg'},
            {'name': 'Xiaomi Redmi Note 12', 'brand': 'Xiaomi', 'price': 8990000, 'image': 'https://example.com/xiaomiredminote12.jpg'},
            {'name': 'Oppo A96', 'brand': 'Oppo', 'price': 7990000, 'image': 'https://example.com/oppoa96.jpg'},
            {'name': 'Oppo Reno 8', 'brand': 'Oppo', 'price': 14990000, 'image': 'https://example.com/opporeno8.jpg'},
            {'name': 'iPhone 13', 'brand': 'Apple', 'price': 19990000, 'image': 'https://example.com/iphone13.jpg'},
            {'name': 'iPhone SE (2022)', 'brand': 'Apple', 'price': 12990000, 'image': 'https://example.com/iphonese2022.jpg'},
            {'name': 'Samsung Galaxy S22', 'brand': 'Samsung', 'price': 19990000, 'image': 'https://example.com/samsunggalaxys22.jpg'},
            {'name': 'Samsung Galaxy A34', 'brand': 'Samsung', 'price': 8990000, 'image': 'https://example.com/samsunggalaxya34.jpg'},
            {'name': 'Google Pixel 6a', 'brand': 'Google', 'price': 12990000, 'image': 'https://example.com/googlepixel6a.jpg'},
            {'name': 'Google Pixel 6', 'brand': 'Google', 'price': 15990000, 'image': 'https://example.com/googlepixel6.jpg'},
            {'name': 'Xiaomi 12', 'brand': 'Xiaomi', 'price': 14990000, 'image': 'https://example.com/xiaomi12.jpg'},
            {'name': 'Xiaomi Redmi 10', 'brand': 'Xiaomi', 'price': 5990000, 'image': 'https://example.com/xiaomiredmi10.jpg'},
            {'name': 'Oppo A77', 'brand': 'Oppo', 'price': 6990000, 'image': 'https://example.com/oppoa77.jpg'},
            {'name': 'Oppo Reno 7', 'brand': 'Oppo', 'price': 12990000, 'image': 'https://example.com/opporeno7.jpg'},
        ]

        capacities = ['128GB', '256GB', '512GB']
        colors = ['Black', 'White', 'Blue', 'Red']

        for prod_data in products_data:
            slug = prod_data['name'].lower().replace(' ', '-')
            product, created = Product.objects.get_or_create(
                slug=slug,
                defaults={
                    'category': smartphone_cat,
                    'name': prod_data['name'],
                    'brand': prod_data['brand'],
                    'price': prod_data['price'],
                    'image': prod_data['image'],
                    'specs': {}
                }
            )
            if created:
                self.stdout.write(f"Tạo sản phẩm: {prod_data['name']}")

                # Thêm capacities
                for cap_name in capacities:
                    cap, _ = Capacity.objects.get_or_create(product=product, name=cap_name)

                # Thêm colors
                for color_name in colors:
                    color, _ = Color.objects.get_or_create(product=product, name=color_name, defaults={'price': prod_data['price']})

                # Tạo variants
                for cap in product.capacities.all():
                    for col in product.colors.all():
                        extra_price = 0
                        if '256' in cap.name:
                            extra_price = 2000000
                        elif '512' in cap.name:
                            extra_price = 5000000
                        variant_price = prod_data['price'] + extra_price

                        variant, _ = ProductVariant.objects.get_or_create(
                            product=product,
                            capacity=cap,
                            color=col,
                            defaults={'price': variant_price}
                        )

                        # Tạo inventory
                        Inventory.objects.get_or_create(
                            product_variant=variant,
                            defaults={'stock_quantity': 10}
                        )

        self.stdout.write(self.style.SUCCESS("Hoàn thành thêm dữ liệu mẫu cho sản phẩm."))
