// document.addEventListener("DOMContentLoaded", function () {
//   let selectedCapacity = null;
//   let selectedColor = null;
//   const priceElement = document.getElementById("product-price");
//   const productId = document.getElementById("product-price").dataset.productId;

//   // Hàm gọi API để lấy giá
//   async function updatePrice() {
//     if (selectedCapacity && selectedColor) {
//       try {
//         const response = await fetch(
//           `/api/get-price/?product=${productId}&capacity=${selectedCapacity}&color=${selectedColor}`
//         );
//         const data = await response.json();
//         if (data.price) {
//           priceElement.innerText = data.price.toLocaleString("vi-VN") + "đ";
//         } else {
//           priceElement.innerText = "Liên hệ";
//         }
//       } catch (err) {
//         console.error("Lỗi khi cập nhật giá:", err);
//       }
//     }
//   }

//   // Chọn dung lượng
//   document.querySelectorAll(".capacity-btn").forEach((btn) => {
//     btn.addEventListener("click", function () {
//       // Reset class active
//       document
//         .querySelectorAll(".capacity-btn")
//         .forEach((b) => b.classList.remove("active"));
//       // Đánh dấu nút này
//       this.classList.add("active");
//       selectedCapacity = this.dataset.capacity;
//       updatePrice();
//     });
//   });

//   // Chọn màu
//   document.querySelectorAll(".color-btn").forEach((btn) => {
//     btn.addEventListener("click", function () {
//       // Reset class active
//       document
//         .querySelectorAll(".color-btn")
//         .forEach((b) => b.classList.remove("active"));
//       // Đánh dấu nút này
//       this.classList.add("active");
//       selectedColor = this.dataset.color;
//       updatePrice();
//     });
//   });
// });
document.addEventListener("DOMContentLoaded", function () {
  let selectedCapacity = null;
  let selectedColor = null;
  const priceElement = document.getElementById("product-price");
  const productId = priceElement.dataset.productId;
  const btnAddCart = document.getElementById("btnAddCart");

  // Hàm lấy CSRF
  function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== "") {
      const cookies = document.cookie.split(";");
      for (let cookie of cookies) {
        cookie = cookie.trim();
        if (cookie.startsWith(name + "=")) {
          cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
          break;
        }
      }
    }
    return cookieValue;
  }

  // Hàm gọi API để lấy giá
  async function updatePrice() {
    if (selectedCapacity && selectedColor) {
      try {
        const response = await fetch(
          `/api/get-price/?product=${productId}&capacity=${selectedCapacity}&color=${selectedColor}`
        );
        const data = await response.json();
        if (data.price && data.price > 0) {
          priceElement.innerText = data.price.toLocaleString("vi-VN") + " đ";
        } else {
          priceElement.innerText = "Liên hệ";
        }
      } catch (err) {
        console.error("Lỗi khi cập nhật giá:", err);
      }
    }
  }

  // Chọn dung lượng
  document.querySelectorAll(".capacity-btn").forEach((btn) => {
    btn.addEventListener("click", function () {
      document
        .querySelectorAll(".capacity-btn")
        .forEach((b) => b.classList.remove("active"));
      this.classList.add("active");
      selectedCapacity = this.dataset.capacity;
      updatePrice();
    });
  });

  // Chọn màu
  document.querySelectorAll(".color-btn").forEach((btn) => {
    btn.addEventListener("click", function () {
      document
        .querySelectorAll(".color-btn")
        .forEach((b) => b.classList.remove("active"));
      this.classList.add("active");
      selectedColor = this.dataset.color;
      updatePrice();
    });
  });

  // Thêm vào giỏ hàng
  btnAddCart.addEventListener("click", function (e) {
    e.preventDefault();

    if (!selectedCapacity || !selectedColor) {
      alert("Vui lòng chọn dung lượng và màu sắc!");
      return;
    }

    fetch("/cart/add/", {
      method: "POST",
      headers: {
        "X-CSRFToken": getCookie("csrftoken"),
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: `product_id=${productId}&capacity_id=${selectedCapacity}&color_id=${selectedColor}&quantity=1`,
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.success) {
          alert("Đã thêm vào giỏ hàng!");
          const cartCount = document.querySelector("#cart-count");
          if (cartCount) {
            cartCount.innerText = data.cart_count;
          }
        }
      })
      .catch((err) => console.error("Lỗi thêm giỏ hàng:", err));
  });
});
