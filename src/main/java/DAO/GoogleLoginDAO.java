package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Giả sử bạn có lớp này để kết nối cơ sở dữ liệu

public class GoogleLoginDAO {

    public boolean isUserExist(String email) {
        String sql = "SELECT * FROM customers WHERE email = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            return rs.next(); // Trả về true nếu người dùng đã có trong database
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addUser(String firstName, String lastName, String username, String email) {
        boolean result = false;

        String sql = "INSERT INTO customers (first_name, last_name, username, passwordHash,email, phone_number) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, username);  // Username có thể là email hoặc tên người dùng từ Google
            pstmt.setString(4, "");
            pstmt.setString(5, email); // Mật khẩu trống hoặc có thể để mặc định nếu bạn không sử dụng mật khẩu
            pstmt.setString(6, ""); // Số điện thoại để trống

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu việc thêm người dùng thành công

        } catch (SQLException e) {
            // Kiểm tra nếu lỗi là vi phạm unique constraint
            if (e.getErrorCode() == 1062) {  // MySQL error code for duplicate entry
                System.out.println("Email already exists.");
            }
            e.printStackTrace();
        }
        return result;
    }

    public boolean addCartForUser(int customerId) {
        String sql = "INSERT INTO carts (customer_id) VALUES (?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, customerId);
            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getCustomerIdByEmail(String email) {
        String sql = "SELECT customer_id FROM customers WHERE email = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);  // Thực hiện truy vấn với email
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("customer_id");  // Trả về customer_id từ kết quả truy vấn
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;  // Trả về -1 nếu không tìm thấy customer_id
    }

}
