package servlet;

import DAO.UserRegister;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import model.User;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserRegister userRegister;

    @Override
    public void init() throws ServletException {
        userRegister = new UserRegister();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Đặt mã hóa UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String password = request.getParameter("passwordHash");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");

        // Kiểm tra mật khẩu và xác nhận mật khẩu có khớp không
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Mật khẩu và xác nhận mật khẩu không khớp.");
            request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
            return;
        }

        // Mã hóa mật khẩu
        String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());

        // Tạo đối tượng User từ thông tin nhận được
        User newUser = new User(firstname, lastname, username, passwordHash, email, phonenumber);

        // Kiểm tra xem email đã tồn tại chưa
        if (userRegister.isEmailExist(email)) {
            // Nếu email đã tồn tại, thông báo lỗi và chuyển lại trang đăng ký
            request.setAttribute("errorMessage", "Email đã tồn tại trong hệ thống.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/register.jsp");
            dispatcher.forward(request, response);
        } else {
            // Nếu email chưa tồn tại, tiến hành đăng ký người dùng
            boolean isRegistered = userRegister.registerUser(newUser);

            // Phản hồi cho người dùng dựa trên kết quả đăng ký
            if (isRegistered) {
                request.setAttribute("successMessage", "Đăng ký thành công! Bạn sẽ được chuyển hướng đến trang đăng nhập.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/register.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Đăng ký thất bại!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/register.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}



