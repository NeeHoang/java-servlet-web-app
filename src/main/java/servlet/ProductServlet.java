package servlet;

import DAO.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> aonam = productDAO.getProductsByCategory(11);
        List<Product> quannam = productDAO.getProductsByCategory(12);
        List<Product> giaynam = productDAO.getProductsByCategory(13);
        List<Product> aonu = productDAO.getProductsByCategory(21);
        List<Product> quannu = productDAO.getProductsByCategory(22);
        List<Product> giaynu = productDAO.getProductsByCategory(23);
        List<Product> vaynu = productDAO.getProductsByCategory(24);
        List<Product> phukien = productDAO.getProductsByCategory(31);

        // Đưa các danh sách vào request để truyền sang JSP
        request.setAttribute("aonam", aonam);
        request.setAttribute("quannam", quannam);
        request.setAttribute("giaynam", giaynam);
        request.setAttribute("aonu", aonu);
        request.setAttribute("quannu", quannu);
        request.setAttribute("giaynu", giaynu);
        request.setAttribute("vaynu", vaynu);
        request.setAttribute("phukien", phukien);

        // Chuyển hướng đến trang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/sanpham.jsp");
        dispatcher.forward(request, response);
    }
}
