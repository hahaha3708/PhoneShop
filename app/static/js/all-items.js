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
// Nhẹ nhàng: Enter để chuyển trang (UX nhỏ)
document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("gotoPageForm");
  if (!form) return;

  const pageInput = form.querySelector('input[name="page"]');
  pageInput.addEventListener("keypress", function (e) {
    if (e.key === "Enter") {
      e.preventDefault();
      // Giữ số trang trong khoảng hợp lệ
      let page = parseInt(pageInput.value);
      let max = parseInt(pageInput.getAttribute("max"));
      let min = parseInt(pageInput.getAttribute("min"));
      if (page < min) page = min;
      if (page > max) page = max;
      pageInput.value = page;
      form.submit();
    }
  });
});
