document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("signupForm");

  form.addEventListener("submit", (e) => {
    const btn = form.querySelector("button[type=submit]");
    btn.innerHTML = "Đang xử lý...";
    btn.disabled = true;

    setTimeout(() => {
      btn.innerHTML = "Đăng ký";
      btn.disabled = false;
    }, 2000); // giả lập loading
  });
});

function togglePassword(fieldId, element) {
  const passwordField = document.getElementById(fieldId);
  const img = element.querySelector("img");

  if (passwordField.type === "password") {
    passwordField.type = "text";
    img.src = "/static/img/show.png"; // icon mắt mở
  } else {
    passwordField.type = "password";
    img.src = "/static/img/hide.png"; // icon mắt đóng
  }
}

// Validation form
document.getElementById("signupForm").addEventListener("submit", function (e) {
  const password1 = document.getElementById("id_password1").value;
  const password2 = document.getElementById("id_password2").value;
  const email = document.getElementById("id_email").value;

  // Kiểm tra mật khẩu khớp
  if (password1 !== password2) {
    e.preventDefault();
    alert("Mật khẩu nhập lại không khớp!");
    return;
  }

  // Kiểm tra độ dài mật khẩu
  if (password1.length < 8) {
    e.preventDefault();
    alert("Mật khẩu phải có ít nhất 8 ký tự!");
    return;
  }

  // Kiểm tra email format
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (email && !emailRegex.test(email)) {
    e.preventDefault();
    alert("Email không đúng định dạng!");
    return;
  }
});
