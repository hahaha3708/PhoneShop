// Nhẹ nhàng: thêm title cho thẻ dài + khôi phục cuộn sau khi lọc (UX nhỏ)
document.querySelectorAll(".product-card .title").forEach((el) => {
  if (!el.getAttribute("title"))
    el.setAttribute("title", el.textContent.trim());
});

(function rememberScroll() {
  const key = "all-items-scroll";
  const form =
    document.querySelector(".all-items form.filter-form") ||
    document.querySelector(".all-items aside form");
  if (!form) return;

  window.addEventListener("beforeunload", () => {
    sessionStorage.setItem(key, String(window.scrollY || 0));
  });

  const y = Number(sessionStorage.getItem(key) || 0);
  if (y) {
    window.scrollTo({ top: y, behavior: "instant" });
  }
})();
