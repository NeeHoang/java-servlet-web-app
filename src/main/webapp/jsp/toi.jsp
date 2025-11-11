<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tôi</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    header {
      background-color: #333;
      color: white;
      padding: 10px 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .top-bar {
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .contact-info, .top-nav {
      display: flex;
      gap: 15px;
    }
    .top-nav ul {
      display: flex;
      list-style: none;
      padding: 0;
    }
    .top-nav ul li {
      margin: 0 10px;
    }
    .top-nav ul li a {
      color: white;
      text-decoration: none;
    }
    .top-nav ul li a:hover {
      color: blue;
    }
    section {
      padding: 20px;
    }
    h1 {
      font-size: 36px;
      color: #333;
    }
    p {
      font-size: 18px;
      line-height: 1.6;
      color: #555;
    }
    .about-section {
      background-color: #fff;
      padding: 40px 20px;
      margin: 20px auto;
      width: 80%;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      text-align: left;
    }
    .about-section figure {
      display: inline-block;
      text-align: center;
    }
    .about-section img {
      max-width: 100%;
      border-radius: 8px;
      transition: transform 0.3s ease, filter 0.3s ease;
      border: none;
    }
    /* Hiệu ứng chuyển sang màu xanh dương khi di chuột */
    .about-section img:hover {
      transform: scale(1.05);
      filter: opacity(0.8) drop-shadow(0 0 10px blue);
    }
    .about-section figcaption {
      margin-top: 10px;
      font-size: 18px;
      color: #555;
    }
    footer {
      background-color: #333;
      color: #fff;
      text-align: center;
      padding: 10px 0;
      position: relative;
      bottom: 0;
      width: 100%;
    }
  </style>
</head>
<body>
<header>
  <div class="top-bar">
    <div class="contact-info">
      <span class="language">Tên Web</span>
    </div>
    <nav class="top-nav">
      <ul>
        <li><a href="${pageContext.request.contextPath}/jsp/index.jsp">Trang Chủ</a></li>
        <li><a href="${pageContext.request.contextPath}/products">Sản Phẩm</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/gioithieu.jsp">Giới Thiệu</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/lienhe.jsp">Liên Hệ</a></li>
        <li><a href="${pageContext.request.contextPath}/login" class="login-button">Đăng nhập</a></li>
        <li><a href="${pageContext.request.contextPath}/jsp/toi.jsp">Tôi</a></li>
      </ul>
    </nav>
  </div>
</header>

<section class="about-section">
  <figure>
    <figcaption>Giỏ Hàng</figcaption>
    <!-- Thêm liên kết bao quanh hình ảnh -->
    <a href="${pageContext.request.contextPath}/jsp/giohang.jsp">
      <img src="${pageContext.request.contextPath}/images/giohang.png" width="240" height="240" alt="Giỏ Hàng">
    </a>
  </figure>
</section>

<footer>
  <p>&copy; 2024 StyleNest - All Rights Reserved</p>
</footer>
</body>
</html>