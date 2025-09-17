from django import template


register = template.Library()


@register.filter
def vnd(value):
    try:
        v = int(value)
    except (TypeError, ValueError):
        return value
    return f"{v:,.0f}₫".replace(',', '.')