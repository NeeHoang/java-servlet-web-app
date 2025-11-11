<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Admin.Product" %>
<%
    // Lấy danh sách sản phẩm từ request attribute
    List<Product> productList = (List<Product>) request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: blue; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<a href="ProductServlet?action=new">Thêm sản phẩm mới</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>SKU</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Danh mục</th>
        <th>Hình ảnh</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <% if (productList != null) {
        for (Product product : productList) { %>
    <tr>
        <td><%= product.getProductId() %></td>
        <td><%= product.getSKU() %></td>
        <td><%= product.getDescription() %></td>
        <td><%= product.getPrice() %></td>
        <td><%= product.getCategoryId() %></td>
        <td>
            <img src="<%= product.getProductLinks() %>" alt="Product Image" style="width: 100px; height: auto;" />
        </td>

        <td>
            <a href="ProductServlet?action=edit&id=<%= product.getProductId() %>">Sửa</a> |
            <a href="ProductServlet?action=delete&id=<%= product.getProductId() %>"
               onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">Xóa</a>
        </td>
    </tr>
    <% } } else { %>
    <tr>
        <td colspan="7">Không có sản phẩm nào!</td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>