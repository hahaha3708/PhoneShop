function updateCart(id, action) {
  fetch(updateUrl, {
    method: "POST",
    headers: {
      "X-CSRFToken": csrfToken,
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: `id=${id}&action=${action}`,
  })
    .then((res) => res.json())
    .then(() => {
      location.reload(); // Reload lại trang giỏ hàng
    })
    .catch((err) => console.error("Lỗi update giỏ hàng:", err));
}

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-qty-plus]").forEach((btn) => {
    btn.addEventListener("click", () => updateCart(btn.dataset.id, "plus"));
  });
  document.querySelectorAll("[data-qty-minus]").forEach((btn) => {
    btn.addEventListener("click", () => updateCart(btn.dataset.id, "minus"));
  });
  document.querySelectorAll("[data-remove]").forEach((btn) => {
    btn.addEventListener("click", () => updateCart(btn.dataset.id, "remove"));
  });
});
