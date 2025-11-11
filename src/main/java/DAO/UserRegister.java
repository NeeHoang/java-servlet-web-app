package DAO;

import java.sql.*;
import model.User;

public class UserRegister {

    public boolean isEmailExist(String email) {
        // Kiểm tra email đã tồn tại trong cơ sở dữ liệu chưa
        String sql = "SELECT * FROM customers WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // Nếu có dòng trả về nghĩa là email đã tồn tại
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Cập nhật phương thức này để nhận đối tượng User và thêm phần tạo cart
    public boolean registerUser(User user) {
        String insertCustomerSQL = "INSERT INTO customers (first_name, last_name, username, passwordHash, email, phone_number) VALUES (?, ?, ?, ?, ?, ?)";
        String insertCartSQL = "INSERT INTO carts (customer_id) VALUES (?)"; // SQL để thêm cart với customer_id

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmtCustomer = conn.prepareStatement(insertCustomerSQL, PreparedStatement.RETURN_GENERATED_KEYS);
             PreparedStatement pstmtCart = conn.prepareStatement(insertCartSQL)) {

            // Thêm thông tin người dùng vào bảng customers
            pstmtCustomer.setString(1, user.getFirstname());
            pstmtCustomer.setString(2, user.getLastname());
            pstmtCustomer.setString(3, user.getUsername());
            pstmtCustomer.setString(4, user.getPasswordHash());  // Lưu mật khẩu đã mã hóa
            pstmtCustomer.setString(5, user.getEmail());
            pstmtCustomer.setString(6, user.getPhonenumber());

            int rowsAffected = pstmtCustomer.executeUpdate();
            if (rowsAffected > 0) {
                // Lấy customer_id vừa được tạo
                ResultSet rs = pstmtCustomer.getGeneratedKeys();
                if (rs.next()) {
                    int customerId = rs.getInt(1); // customer_id vừa được tạo

                    // Thêm cart cho customer mới
                    pstmtCart.setInt(1, customerId);
                    int cartRowsAffected = pstmtCart.executeUpdate();
                    return cartRowsAffected > 0; // Nếu thêm cart thành công thì trả về true
                }
            }
            return false; // Không thể thêm người dùng hoặc cart
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Đăng ký thất bại
        }
    }
}
