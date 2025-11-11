package servlet;

import DAO.GoogleLoginDAO;
import model.GoogleAccount;
import model.GoogleLogin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/loginGoogle"})
public class LoginGoogle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String code = request.getParameter("code");
        String error = request.getParameter("error");

        // Nếu người dùng hủy ủy quyền
        if (error != null) {
            request.getRequestDispatcher("/login").forward(request, response);
        }

        // Lấy token và thông tin người dùng từ Google
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        GoogleAccount googleAccount = gg.getUserInfo(accessToken);

        String email = googleAccount.getEmail();
        String firstName = googleAccount.getFamily_name();
        String lastName = googleAccount.getGiven_name();
        String username = googleAccount.getName(); // Username có thể là tên hoặc email

        GoogleLoginDAO loginDAO = new GoogleLoginDAO();

        // Kiểm tra xem người dùng đã có trong hệ thống chưa
        if (!loginDAO.isUserExist(email)) {
            // Nếu chưa, thêm người dùng vào cơ sở dữ liệu
            if (loginDAO.addUser(firstName, lastName, username, email)) {
                // Lấy customer_id vừa tạo
                int customerId = loginDAO.getCustomerIdByEmail(email);

                // Thêm giỏ hàng cho người dùng
                loginDAO.addCartForUser(customerId);

                // Lưu thông tin người dùng vào session
                request.getSession().setAttribute("username", username);
                response.sendRedirect("jsp/index.jsp"); // Chuyển hướng đến trang chủ sau khi đăng nhập
            } else {
                response.getWriter().println("Email đã tồn tại trong hệ thống.");
            }
        } else {
            // Nếu người dùng đã có, lưu thông tin vào session và chuyển hướng đến trang chủ
            request.getSession().setAttribute("username", username);
            response.sendRedirect("jsp/index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
