<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Admin.Product" %>
<%
  // Lấy sản phẩm hiện tại từ request attribute
  Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sửa sản phẩm</title>
</head>
<body>
<h1>Sửa sản phẩm</h1>
<form action="ProductServlet" method="post">
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="id" value="<%= product.getProductId() %>">
  <label for="sku">SKU:</label><br>
  <input type="text" id="sku" name="sku" value="<%= product.getSKU() %>" required><br><br>
  <label for="description">Tên sản phẩm:</label><br>
  <textarea id="description" name="description" required><%= product.getDescription() %></textarea><br><br>
  <label for="price">Giá:</label><br>
  <input type="number" id="price" name="price" step="0.01" value="<%= product.getPrice() %>" required><br><br>
  <label for="category_id">Danh mục:</label><br>
  <input type="number" id="category_id" name="category_id" value="<%= product.getCategoryId() %>" required><br><br>
  <label for="product_links">Link hình ảnh sản phẩm:</label><br>
  <input type="text" id="product_links" name="product_links" value="<%= product.getProductLinks() %>"><br><br>
  <button type="submit">Cập nhật sản phẩm</button>
</form>
<a href="ProductServlet">Quay lại danh sách sản phẩm</a>
</body>
</html>