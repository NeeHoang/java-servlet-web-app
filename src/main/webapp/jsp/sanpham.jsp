<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách sản phẩm</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
      text-align: center;
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
      color: blue; /* Đổi màu chữ thành xanh dương khi hover */
    }
    section {
      padding: 20px;
      text-align: center;
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
    }
    .about-section img {
      max-width: 100%;
      border-radius: 8px;
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

<%
  // Lấy tham số category từ URL
  String categoryParam = request.getParameter("category");
  List<Product> selectedProducts = null;

  if ("1".equals(categoryParam)) {
    selectedProducts = (List<Product>) request.getAttribute("aonam");
  } else if ("2".equals(categoryParam)) {
    selectedProducts = (List<Product>) request.getAttribute("quannam");
  } else if ("3".equals(categoryParam)) {
    selectedProducts = (List<Product>) request.getAttribute("giaynam");
  }else if ("4".equals(categoryParam)) {
    selectedProducts = (List<Product>) request.getAttribute("aonu");
  } else if ("5".equals(categoryParam)) {
    selectedProducts = (List<Product>) request.getAttribute("quannu");
  }else if ("6".equals(categoryParam)) {
    selectedProducts = (List<Product>) request.getAttribute("giaynu");
  } else if ("7".equals(categoryParam)) {
    selectedProducts = (List<Product>) request.getAttribute("vaynu");
  }else if ("8".equals(categoryParam)) {
    selectedProducts = (List<Product>) request.getAttribute("phukien");
  }
%>

<h2>Danh sách sản phẩm</h2>

<%
  if (selectedProducts == null || selectedProducts.isEmpty()) {
%>
<p>Không có sản phẩm nào được tìm thấy.</p>
<%
} else {
%>
<div class="product-grid">
  <%
    for (Product product : selectedProducts) {
  %>
  <div class="product-card">
    <div class="product-square"></div>
    <div class="product-info">
      <h3><%= product.getDescription() %></h3>
      <p><%= product.getPrice() %> VND</p>
    </div>
  </div>
  <%
      }
    }
  %>
</div>




<style>
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
  }

  .product-card {
    text-align: center;
  }

  .product-square {
    width: 300px;
    height: 300px;
    background-color: #f0f8ff; /* Màu sắc cho khung hình vuông */
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 0 auto; /* Căn giữa ô vuông */
  }

  .product-info {
    margin-top: 10px;
  }

  .product-info h3 {
    font-size: 16px;
    margin: 5px 0;
  }

  .product-info p {
    font-size: 14px;
    color: #888;
  }

</style>



</body>
</html>