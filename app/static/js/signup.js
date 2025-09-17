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

function togglePassword(fieldId, el) {
  const input = document.getElementById(fieldId);
  const icon = el.querySelector("img");

  if (input.type === "password") {
    input.type = "text";
    icon.src = "/static/img/show.png";
  } else {
    input.type = "password";
    icon.src = "/static/img/hide.png";
  }
}
