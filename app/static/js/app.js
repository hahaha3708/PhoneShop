// Demo add-to-cart hành vi phía client (tạm thời)
(function () {
  document.addEventListener("click", function (e) {
    const addBtn = e.target.closest("[data-add-to-cart]");
    if (addBtn) {
      e.preventDefault();
      const id = addBtn.getAttribute("data-id");
      // TODO: Gọi fetch POST tới /cart/add/ khi có backend
      alert("Đã thêm sản phẩm #" + id + " vào giỏ (demo)");
    }
  });

  // Show login modal
  const loginBtn = document.getElementById("loginBtn");
  if (loginBtn) {
    loginBtn.addEventListener("click", function (e) {
      e.preventDefault();
      const modal = new bootstrap.Modal(document.getElementById("loginModal"));
      modal.show();
    });
  }
})();
