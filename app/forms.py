from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import CustomUser

class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = CustomUser
        fields = ["email", "password1", "password2"]

class CustomAuthenticationForm(AuthenticationForm):
    username = forms.EmailField(label="Email")

from django import forms
from .models import Product, Category, Accessory, AccessoryCategory

class ProductForm(forms.ModelForm):
    category = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        empty_label="Chọn danh mục",
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    # Thông số kỹ thuật
    screen_size = forms.CharField(
        max_length=100,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Kích thước màn hình (vd: 6.1 inch)'}),
        label="Kích thước màn hình"
    )
    screen_resolution = forms.CharField(
        max_length=100,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Độ phân giải màn hình (vd: 1170 x 2532 pixels)'}),
        label="Độ phân giải màn hình"
    )
    processor = forms.CharField(
        max_length=200,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Chip xử lý (vd: Apple A15 Bionic)'}),
        label="Chip xử lý"
    )
    ram = forms.CharField(
        max_length=100,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'RAM (vd: 6GB)'}),
        label="RAM"
    )
    storage = forms.CharField(
        max_length=100,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Bộ nhớ trong (vd: 128GB)'}),
        label="Bộ nhớ trong"
    )
    battery = forms.CharField(
        max_length=100,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Pin (vd: 3095 mAh)'}),
        label="Pin"
    )
    os = forms.CharField(
        max_length=100,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Hệ điều hành (vd: iOS 15)'}),
        label="Hệ điều hành"
    )
    camera = forms.CharField(
        max_length=200,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Camera (vd: 12MP + 12MP)'}),
        label="Camera"
    )
    weight = forms.CharField(
        max_length=100,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Trọng lượng (vd: 174g)'}),
        label="Trọng lượng"
    )
    dimensions = forms.CharField(
        max_length=100,
        required=False,
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Kích thước (vd: 146.7 x 71.5 x 7.8 mm)'}),
        label="Kích thước"
    )

    class Meta:
        model = Product
        fields = ['category', 'name', 'slug', 'brand', 'price', 'image']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Tên sản phẩm'}),
            'slug': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Slug (tự động tạo nếu để trống)'}),
            'brand': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Hãng sản xuất'}),
            'price': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Giá sản phẩm'}),
            'image': forms.URLInput(attrs={'class': 'form-control', 'placeholder': 'URL hình ảnh'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Tự động tạo slug từ name nếu chưa có
        if self.instance and self.instance.pk:
            self.fields['slug'].required = False
            # Nếu có specs hiện tại, parse và điền vào các field
            if self.instance.specs:
                try:
                    import json
                    specs = json.loads(self.instance.specs)
                    self.fields['screen_size'].initial = specs.get('screen_size', '')
                    self.fields['screen_resolution'].initial = specs.get('screen_resolution', '')
                    self.fields['processor'].initial = specs.get('processor', '')
                    self.fields['ram'].initial = specs.get('ram', '')
                    self.fields['storage'].initial = specs.get('storage', '')
                    self.fields['battery'].initial = specs.get('battery', '')
                    self.fields['os'].initial = specs.get('os', '')
                    self.fields['camera'].initial = specs.get('camera', '')
                    self.fields['weight'].initial = specs.get('weight', '')
                    self.fields['dimensions'].initial = specs.get('dimensions', '')
                except (json.JSONDecodeError, TypeError):
                    pass

    def clean_slug(self):
        slug = self.cleaned_data.get('slug')
        if not slug and self.cleaned_data.get('name'):
            from django.utils.text import slugify
            slug = slugify(self.cleaned_data['name'])
            # Đảm bảo slug unique
            original_slug = slug
            counter = 1
            while Product.objects.filter(slug=slug).exclude(pk=self.instance.pk if self.instance else None).exists():
                slug = f"{original_slug}-{counter}"
                counter += 1
        return slug

    def save(self, commit=True):
        instance = super().save(commit=False)
        # Tạo JSON specs từ các field
        specs = {}
        if self.cleaned_data.get('screen_size'):
            specs['screen_size'] = self.cleaned_data['screen_size']
        if self.cleaned_data.get('screen_resolution'):
            specs['screen_resolution'] = self.cleaned_data['screen_resolution']
        if self.cleaned_data.get('processor'):
            specs['processor'] = self.cleaned_data['processor']
        if self.cleaned_data.get('ram'):
            specs['ram'] = self.cleaned_data['ram']
        if self.cleaned_data.get('storage'):
            specs['storage'] = self.cleaned_data['storage']
        if self.cleaned_data.get('battery'):
            specs['battery'] = self.cleaned_data['battery']
        if self.cleaned_data.get('os'):
            specs['os'] = self.cleaned_data['os']
        if self.cleaned_data.get('camera'):
            specs['camera'] = self.cleaned_data['camera']
        if self.cleaned_data.get('weight'):
            specs['weight'] = self.cleaned_data['weight']
        if self.cleaned_data.get('dimensions'):
            specs['dimensions'] = self.cleaned_data['dimensions']

        import json
        instance.specs = json.dumps(specs, ensure_ascii=False)
        if commit:
            instance.save()
        return instance

class AccessoryForm(forms.ModelForm):
    category = forms.ModelChoiceField(
        queryset=AccessoryCategory.objects.all(),
        empty_label="Chọn danh mục",
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    # Thông số kỹ thuật cho phụ kiện
    specs = forms.CharField(
        max_length=1000,
        required=False,
        widget=forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Thông số kỹ thuật (vd: Kích thước: 10x5cm, Trọng lượng: 50g, Chất liệu: Nhựa)', 'rows': 3}),
        label="Thông số kỹ thuật"
    )

    class Meta:
        model = Accessory
        fields = ['category', 'name', 'slug', 'brand', 'price', 'image', 'specs']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Tên phụ kiện'}),
            'slug': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Slug (tự động tạo nếu để trống)'}),
            'brand': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Hãng sản xuất'}),
            'price': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Giá phụ kiện'}),
            'image': forms.URLInput(attrs={'class': 'form-control', 'placeholder': 'URL hình ảnh'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Tự động tạo slug từ name nếu chưa có
        if self.instance and self.instance.pk:
            self.fields['slug'].required = False

    def clean_slug(self):
        slug = self.cleaned_data.get('slug')
        if not slug and self.cleaned_data.get('name'):
            from django.utils.text import slugify
            slug = slugify(self.cleaned_data['name'])
            # Đảm bảo slug unique
            original_slug = slug
            counter = 1
            while Accessory.objects.filter(slug=slug).exclude(pk=self.instance.pk if self.instance else None).exists():
                slug = f"{original_slug}-{counter}"
                counter += 1
        return slug
