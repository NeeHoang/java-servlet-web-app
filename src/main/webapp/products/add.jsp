<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Thêm sản phẩm mới</title>
</head>
<body>
<h1>Thêm sản phẩm mới</h1>
<form action="ProductServlet" method="post">
  <input type="hidden" name="action" value="insert">
  <label for="sku">SKU:</label><br>
  <input type="text" id="sku" name="sku" required><br><br>
  <label for="description">Tên sản phẩm:</label><br>
  <textarea id="description" name="description" required></textarea><br><br>
  <label for="price">Giá:</label><br>
  <input type="number" id="price" name="price" step="0.01" required><br><br>
  <label for="category_id">Danh mục:</label><br>
  <input type="number" id="category_id" name="category_id" required><br><br>
  <label for="product_links">Link hình ảnh sản phẩm:</label><br>
  <input type="text" id="product_links" name="product_links"><br><br>
  <button type="submit">Thêm sản phẩm</button>
</form>
<a href="ProductServlet">Quay lại danh sách sản phẩm</a>
</body>
</html>