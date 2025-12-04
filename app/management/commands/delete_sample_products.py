from django.core.management.base import BaseCommand
from app.models import Product

class Command(BaseCommand):
    help = "Xóa dữ liệu mẫu sản phẩm đã thêm"

    def handle(self, *args, **kwargs):
        # Danh sách tên sản phẩm mẫu đã thêm
        sample_product_names = [
            'iPhone 15 Pro', 'iPhone 15 Pro Max', 'Samsung Galaxy S24 Ultra', 'Samsung Galaxy Z Fold 5',
            'Google Pixel 8 Pro', 'Google Pixel 7a', 'Xiaomi 14', 'Xiaomi 14 Pro', 'Oppo Find X7', 'Oppo Reno 10 Pro',
            'iPhone 14', 'iPhone 14 Pro', 'Samsung Galaxy S23', 'Samsung Galaxy A54', 'Google Pixel 8', 'Google Pixel 7',
            'Xiaomi 13', 'Xiaomi Redmi Note 12', 'Oppo A96', 'Oppo Reno 8', 'iPhone 13', 'iPhone SE (2022)',
            'Samsung Galaxy S22', 'Samsung Galaxy A34', 'Google Pixel 6a', 'Google Pixel 6', 'Xiaomi 12',
            'Xiaomi Redmi 10', 'Oppo A77', 'Oppo Reno 7'
        ]

        deleted_count = 0
        for name in sample_product_names:
            try:
                product = Product.objects.get(name=name)
                product.delete()
                deleted_count += 1
                self.stdout.write(f"Đã xóa sản phẩm: {name}")
            except Product.DoesNotExist:
                self.stdout.write(f"Sản phẩm không tồn tại: {name}")

        self.stdout.write(self.style.SUCCESS(f"Đã xóa {deleted_count} sản phẩm mẫu."))
