from django.core.management.base import BaseCommand
from app.models import AccessoryCategory, Accessory, AccessoryColor, AccessoryVariant, Inventory

class Command(BaseCommand):
    help = "Thêm dữ liệu mẫu cho phụ kiện (khoảng 30 cái)"

    def handle(self, *args, **kwargs):
        # Tạo categories nếu chưa có
        categories = ['Case', 'Screen Protector', 'Charger', 'Headphones', 'Cable']
        for cat_name in categories:
            cat, created = AccessoryCategory.objects.get_or_create(
                name=cat_name,
                defaults={'slug': cat_name.lower()}
            )
            if created:
                self.stdout.write(f"Tạo category: {cat_name}")

        case_cat = AccessoryCategory.objects.get(name='Case')
        screen_cat = AccessoryCategory.objects.get(name='Screen Protector')
        charger_cat = AccessoryCategory.objects.get(name='Charger')
        headphones_cat = AccessoryCategory.objects.get(name='Headphones')
        cable_cat = AccessoryCategory.objects.get(name='Cable')

        # Dữ liệu mẫu cho phụ kiện (khoảng 30 cái)
        accessories_data = [
            {'name': 'iPhone 15 Pro Case', 'brand': 'Apple', 'price': 990000, 'image': 'https://example.com/iphone15procase.jpg', 'category': case_cat, 'specs': {'material': 'Silicone'}},
            {'name': 'Samsung Galaxy S24 Ultra Case', 'brand': 'Samsung', 'price': 890000, 'image': 'https://example.com/s24ultracase.jpg', 'category': case_cat, 'specs': {'material': 'Plastic'}},
            {'name': 'Google Pixel 8 Pro Screen Protector', 'brand': 'Google', 'price': 490000, 'image': 'https://example.com/pixel8proscreen.jpg', 'category': screen_cat, 'specs': {'type': 'Tempered Glass'}},
            {'name': 'Xiaomi 14 Charger', 'brand': 'Xiaomi', 'price': 590000, 'image': 'https://example.com/xiaomi14charger.jpg', 'category': charger_cat, 'specs': {'wattage': '65W'}},
            {'name': 'Oppo Find X7 Headphones', 'brand': 'Oppo', 'price': 2990000, 'image': 'https://example.com/oppofindx7headphones.jpg', 'category': headphones_cat, 'specs': {'type': 'Wireless'}},
            {'name': 'iPhone 15 Pro Max Cable', 'brand': 'Apple', 'price': 790000, 'image': 'https://example.com/iphone15promaxcable.jpg', 'category': cable_cat, 'specs': {'length': '1m'}},
            {'name': 'Samsung Galaxy Z Fold 5 Case', 'brand': 'Samsung', 'price': 1290000, 'image': 'https://example.com/zfold5case.jpg', 'category': case_cat, 'specs': {'material': 'Leather'}},
            {'name': 'Google Pixel 7a Screen Protector', 'brand': 'Google', 'price': 390000, 'image': 'https://example.com/pixel7ascreen.jpg', 'category': screen_cat, 'specs': {'type': 'Film'}},
            {'name': 'Xiaomi 14 Pro Charger', 'brand': 'Xiaomi', 'price': 690000, 'image': 'https://example.com/xiaomi14procharger.jpg', 'category': charger_cat, 'specs': {'wattage': '100W'}},
            {'name': 'Oppo Reno 10 Pro Headphones', 'brand': 'Oppo', 'price': 1990000, 'image': 'https://example.com/opporeno10proheadphones.jpg', 'category': headphones_cat, 'specs': {'type': 'Wired'}},
            {'name': 'iPhone 14 Case', 'brand': 'Apple', 'price': 890000, 'image': 'https://example.com/iphone14case.jpg', 'category': case_cat, 'specs': {'material': 'Silicone'}},
            {'name': 'Samsung Galaxy S23 Screen Protector', 'brand': 'Samsung', 'price': 490000, 'image': 'https://example.com/s23screen.jpg', 'category': screen_cat, 'specs': {'type': 'Tempered Glass'}},
            {'name': 'Google Pixel 8 Cable', 'brand': 'Google', 'price': 590000, 'image': 'https://example.com/pixel8cable.jpg', 'category': cable_cat, 'specs': {'length': '2m'}},
            {'name': 'Xiaomi 13 Headphones', 'brand': 'Xiaomi', 'price': 1490000, 'image': 'https://example.com/xiaomi13headphones.jpg', 'category': headphones_cat, 'specs': {'type': 'Wireless'}},
            {'name': 'Oppo A96 Charger', 'brand': 'Oppo', 'price': 490000, 'image': 'https://example.com/oppoa96charger.jpg', 'category': charger_cat, 'specs': {'wattage': '33W'}},
            {'name': 'iPhone 14 Pro Case', 'brand': 'Apple', 'price': 990000, 'image': 'https://example.com/iphone14procase.jpg', 'category': case_cat, 'specs': {'material': 'Plastic'}},
            {'name': 'Samsung Galaxy A54 Screen Protector', 'brand': 'Samsung', 'price': 390000, 'image': 'https://example.com/a54screen.jpg', 'category': screen_cat, 'specs': {'type': 'Film'}},
            {'name': 'Google Pixel 7 Cable', 'brand': 'Google', 'price': 490000, 'image': 'https://example.com/pixel7cable.jpg', 'category': cable_cat, 'specs': {'length': '1.5m'}},
            {'name': 'Xiaomi Redmi Note 12 Headphones', 'brand': 'Xiaomi', 'price': 990000, 'image': 'https://example.com/redminote12headphones.jpg', 'category': headphones_cat, 'specs': {'type': 'Wired'}},
            {'name': 'Oppo Reno 8 Charger', 'brand': 'Oppo', 'price': 590000, 'image': 'https://example.com/opporeno8charger.jpg', 'category': charger_cat, 'specs': {'wattage': '65W'}},
            {'name': 'iPhone 13 Case', 'brand': 'Apple', 'price': 790000, 'image': 'https://example.com/iphone13case.jpg', 'category': case_cat, 'specs': {'material': 'Leather'}},
            {'name': 'Samsung Galaxy S22 Screen Protector', 'brand': 'Samsung', 'price': 490000, 'image': 'https://example.com/s22screen.jpg', 'category': screen_cat, 'specs': {'type': 'Tempered Glass'}},
            {'name': 'Google Pixel 6a Cable', 'brand': 'Google', 'price': 390000, 'image': 'https://example.com/pixel6acable.jpg', 'category': cable_cat, 'specs': {'length': '1m'}},
            {'name': 'Xiaomi 12 Headphones', 'brand': 'Xiaomi', 'price': 1290000, 'image': 'https://example.com/xiaomi12headphones.jpg', 'category': headphones_cat, 'specs': {'type': 'Wireless'}},
            {'name': 'Oppo A77 Charger', 'brand': 'Oppo', 'price': 390000, 'image': 'https://example.com/oppoa77charger.jpg', 'category': charger_cat, 'specs': {'wattage': '18W'}},
            {'name': 'iPhone SE Case', 'brand': 'Apple', 'price': 690000, 'image': 'https://example.com/iphonesecase.jpg', 'category': case_cat, 'specs': {'material': 'Silicone'}},
            {'name': 'Samsung Galaxy A34 Screen Protector', 'brand': 'Samsung', 'price': 290000, 'image': 'https://example.com/a34screen.jpg', 'category': screen_cat, 'specs': {'type': 'Film'}},
            {'name': 'Google Pixel 6 Cable', 'brand': 'Google', 'price': 490000, 'image': 'https://example.com/pixel6cable.jpg', 'category': cable_cat, 'specs': {'length': '2m'}},
            {'name': 'Xiaomi Redmi 10 Headphones', 'brand': 'Xiaomi', 'price': 790000, 'image': 'https://example.com/redmi10headphones.jpg', 'category': headphones_cat, 'specs': {'type': 'Wired'}},
            {'name': 'Oppo Reno 7 Charger', 'brand': 'Oppo', 'price': 490000, 'image': 'https://example.com/opporeno7charger.jpg', 'category': charger_cat, 'specs': {'wattage': '33W'}},
        ]

        colors = ['Black', 'White', 'Blue', 'Red']

        for acc_data in accessories_data:
            slug = acc_data['name'].lower().replace(' ', '-')
            accessory, created = Accessory.objects.get_or_create(
                slug=slug,
                defaults={
                    'name': acc_data['name'],
                    'brand': acc_data['brand'],
                    'price': acc_data['price'],
                    'image': acc_data['image'],
                    'specs': acc_data['specs'],
                    'category': acc_data['category']
                }
            )
            if created:
                self.stdout.write(f"Tạo phụ kiện: {acc_data['name']}")

                # Thêm colors
                for color_name in colors:
                    color, _ = AccessoryColor.objects.get_or_create(accessory=accessory, name=color_name, defaults={'price': acc_data['price']})

                # Tạo variants
                for col in accessory.accessorycolor_set.all():
                    variant, _ = AccessoryVariant.objects.get_or_create(
                        accessory=accessory,
                        color=col,
                        defaults={'price': acc_data['price']}
                    )

                    # Tạo inventory
                    Inventory.objects.get_or_create(
                        accessory_variant=variant,
                        defaults={'stock_quantity': 20}
                    )

        self.stdout.write(self.style.SUCCESS("Hoàn thành thêm dữ liệu mẫu cho phụ kiện."))
