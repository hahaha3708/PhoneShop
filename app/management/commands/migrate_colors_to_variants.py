from django.core.management.base import BaseCommand
from app.models import Product, Capacity, Color, ProductVariant

class Command(BaseCommand):
    help = "Chuyển dữ liệu từ Color (price) sang ProductVariant"

    def handle(self, *args, **kwargs):
        created_count = 0
        skipped_count = 0

        for color in Color.objects.all():
            # lấy tất cả dung lượng của sản phẩm đó
            capacities = Capacity.objects.filter(product=color.product)

            for cap in capacities:
                # kiểm tra nếu variant đã tồn tại thì bỏ qua
                if ProductVariant.objects.filter(
                    product=color.product,
                    capacity=cap,
                    color=color
                ).exists():
                    skipped_count += 1
                    continue

                # ở đây dùng giá từ bảng color
                # bạn có thể tùy biến công thức, ví dụ:
                # nếu dung lượng lớn hơn thì cộng thêm tiền
                base_price = getattr(color, "price", None)

                if base_price is None:
                    continue

                # ví dụ: tăng giá theo dung lượng (chỉ minh họa)
                extra = 0
                if "128" in cap.name:
                    extra = 2000000
                elif "256" in cap.name:
                    extra = 4000000

                final_price = base_price + extra

                ProductVariant.objects.create(
                    product=color.product,
                    capacity=cap,
                    color=color,
                    price=final_price
                )
                created_count += 1

        self.stdout.write(self.style.SUCCESS(
            f"Tạo {created_count} variants, bỏ qua {skipped_count} cái đã có."
        ))
