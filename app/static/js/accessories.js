(function () {
  const priceBox = document.getElementById("priceBox");
  const colorGroup = document.getElementById("colorGroup");

  // COLOR_PRICES được render từ Django: {{ color_prices|safe }}
  if (!priceBox || !colorGroup || typeof COLOR_PRICES === "undefined") return;

  const defaultPrice = parseInt(priceBox.dataset.default || "0", 10);

  function formatVND(x) {
    return Number(x || 0).toLocaleString("vi-VN") + " đ";
  }

  function setActive(btn) {
    document
      .querySelectorAll(".color-pill")
      .forEach((b) => b.classList.remove("active"));
    btn.classList.add("active");
  }

  colorGroup.addEventListener("click", (e) => {
    const btn = e.target.closest("button[data-color-id]");
    if (!btn) return;

    const id = btn.getAttribute("data-color-id");
    const nextPrice = COLOR_PRICES[id]
      ? parseInt(COLOR_PRICES[id], 10)
      : defaultPrice;

    priceBox.textContent = formatVND(nextPrice);
    setActive(btn);
  });

  // auto chọn màu đầu tiên
  const first = colorGroup.querySelector("button[data-color-id]");
  if (first) first.click();
})();
