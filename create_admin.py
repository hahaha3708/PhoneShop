import os
import django
from django.conf import settings

# Thiết lập Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'webbandienthoai.settings')
django.setup()

from app.models import CustomUser

# Tạo tài khoản admin nếu chưa tồn tại
if not CustomUser.objects.filter(email='admin@example.com').exists():
    user = CustomUser.objects.create_superuser(
        email='admin@example.com',
        password='admin123'
    )
    print("Tài khoản admin đã được tạo: admin@example.com / admin123")
else:
    print("Tài khoản admin đã tồn tại.")

# Tạo tài khoản user thường nếu chưa tồn tại
if not CustomUser.objects.filter(email='viet@gmail.com').exists():
    user = CustomUser.objects.create_user(
        email='viet@gmail.com',
        password='123',
        is_staff=False,
        is_superuser=False
    )
    print("Tài khoản user đã được tạo: viet@gmail.com / 123")
else:
    user = CustomUser.objects.get(email='viet@gmail.com')
    user.set_password('123')
    user.is_staff = False
    user.is_superuser = False
    user.save()
    print("Tài khoản user đã được cập nhật: viet@gmail.com / 123")
