<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StyleNest - Fashion Store</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<!-- Header -->
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

<!-- Banner Section -->
<section class="banner" id="home">
    <h2>Tên web</h2>
    <p>Giải đáp cho mọi vấn đề thời trang của bạn.</p>
    <button>Shop Now</button>
</section>

<!-- Categories Section -->
<section id="collections">
    <div class="category-grid">
        <div class="category-item">
            <a href="${pageContext.request.contextPath}/products?category=1">
                <img src="${pageContext.request.contextPath}/images/Men's%20Clothing.png" width="300" height="300" alt="Áo Nam">
                <h3>Áo Nam</h3>
            </a>
        </div>
        <div class="category-item">
            <a href="${pageContext.request.contextPath}/products?category=2">
                <img src="${pageContext.request.contextPath}/images/quannam.png" width="300" height="300" alt="Quần Nam">
                <h3>Quần Nam</h3>
            </a>
        </div>
        <div class="category-item">
            <a href="${pageContext.request.contextPath}/products?category=3">
                <img src="${pageContext.request.contextPath}/images/giaynam.png" width="300" height="300" alt="Giày Nam">
                <h3>Giày Nam</h3>
            </a>
        </div>
        <div class="category-item">
            <a href="${pageContext.request.contextPath}/products?category=4">
                <img src="${pageContext.request.contextPath}/images/aonu.png" width="300" height="300" alt="Áo Nữ">
                <h3>Áo Nữ</h3>
            </a>
        </div>
        <div class="category-item">
            <a href="${pageContext.request.contextPath}/products?category=5">
                <img src="${pageContext.request.contextPath}/images/quannu.png" width="300" height="300" alt="Quần Nữ">
                <h3>Quần Nữ</h3>
            </a>
        </div>
        <div class="category-item">
            <a href="${pageContext.request.contextPath}/products?category=6">
                <img src="${pageContext.request.contextPath}/images/giaynu.png" width="300" height="300" alt="Giày Nữ">
                <h3>Giày Nữ</h3>
            </a>
        </div>
        <div class="category-item">
            <a href="${pageContext.request.contextPath}/products?category=7">
                <img src="${pageContext.request.contextPath}/images/vaynu.png" width="300" height="300" alt="Váy Nữ">
                <h3>Váy Nữ</h3>
            </a>
        </div>
        <div class="category-item">
            <a href="${pageContext.request.contextPath}/products?category=8">
                <img src="${pageContext.request.contextPath}/images/phukien.png" width="300" height="300" alt="Phụ Kiện">
                <h3>Phụ Kiện</h3>
            </a>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-content">
        <p>&copy; 2024 StyleNest - All Rights Reserved</p>
    </div>
</footer>
</body>
</html>
