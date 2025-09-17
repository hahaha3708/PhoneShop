function addToCart(
  product_id,
  capacity_id,
  color_id,
  quantity,
  csrfToken,
  addUrl
) {
  fetch(addUrl, {
    method: "POST",
    headers: {
      "X-CSRFToken": csrfToken,
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: `product_id=${product_id}&capacity_id=${capacity_id}&color_id=${color_id}&quantity=${quantity}`,
  })
    .then((res) => res.json())
    .then((data) => {
      if (data.success) {
        alert("Đã thêm vào giỏ hàng!");
        let cartCount = document.querySelector("#cart-count");
        if (cartCount) cartCount.innerText = data.cart_count;
      }
    });
}
