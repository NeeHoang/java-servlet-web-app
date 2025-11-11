<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
  <title>Đăng nhập</title>
</head>
<body>

<div class="login-container">
  <h2>Đăng Nhập</h2>

  <% if (request.getAttribute("errorMessage") != null) { %>
  <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
  <% } %>

  <!-- Form đăng nhập gửi yêu cầu tới servlet hoặc action tương ứng -->
  <form method="POST" action="login">
    <div class="form-group">
      <label for="username">Tên Đăng Nhập</label>
      <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
    </div>
    <div class="form-group">
      <label for="password">Mật Khẩu</label>
      <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
    </div>
    <button type="submit" class="login-button">Đăng Nhập</button>
  </form>
  <div class="register-link">
    <span>Chưa có tài khoản?</span>
    <a href="${pageContext.request.contextPath}/register">Đăng Ký</a>
  </div>

  <!-- Đăng nhập bằng Google -->
  <div class="social-login">
    <p>Hoặc đăng nhập bằng:</p>
    <div class="google-login">
      <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/BTL/loginGoogle&response_type=code&client_id=108741436637-ujaklh5j6533h55icb2q0358612j39vp.apps.googleusercontent.com&approval_prompt=force" class="btn btn-danger">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
          <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
        </svg>
        <span class="ms-2">Đăng nhập bằng Google</span>
      </a>
    </div>
  </div>
</div>


</body>
</html>
