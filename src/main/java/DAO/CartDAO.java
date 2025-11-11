package DAO;

import model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public boolean addToCart(Cart cart) {
        boolean flag = false;
        String query = "INSERT INTO cart_items(cart_item_id, cart_id, product_id, quantity) VALUES (?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement psmt = con.prepareStatement(query)) {

            psmt.setInt(1, cart.getCartItemId());
            psmt.setInt(2, cart.getCartId());
            psmt.setInt(3, cart.getProductId());
            psmt.setInt(4, cart.getQuantity());
            psmt.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public void removeProduct(int cartItemId) {
        String query = "DELETE FROM cart_items WHERE cart_item_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement psmt = con.prepareStatement(query)) {

            psmt.setInt(1, cartItemId);
            psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeAllProduct() {
        String query = "DELETE FROM cart_items";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement psmt = con.prepareStatement(query)) {

            psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getQuantity(int cartItemId, int productId) {
        int qty = 0;
        String query = "SELECT quantity FROM cart_items WHERE cart_item_id = ? AND product_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement psmt = con.prepareStatement(query)) {

            psmt.setInt(1, cartItemId);
            psmt.setInt(2, productId);

            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    qty = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return qty;
    }

    public void updateQuantity(int cartItemId, int quantity) {
        String query = "UPDATE cart_items SET quantity = ? WHERE cart_item_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement psmt = con.prepareStatement(query)) {

            psmt.setInt(1, quantity);
            psmt.setInt(2, cartItemId);
            psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getProductId(int cartItemId) {
        int pid = 0;
        String query = "SELECT product_id FROM cart_items WHERE cart_item_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement psmt = con.prepareStatement(query)) {

            psmt.setInt(1, cartItemId);
            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    pid = rs.getInt("product_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pid;
    }

    public List<Cart> getCartItemsFromCart(int cartId) {
        List<Cart> list = new ArrayList<>();
        String query = "SELECT ci.* FROM cart_items ci JOIN carts c ON ci.cart_id = c.cart_id WHERE c.cart_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement psmt = con.prepareStatement(query)) {

            psmt.setInt(1, cartId);

            try (ResultSet rs = psmt.executeQuery()) {
                while (rs.next()) {
                    Cart cart = new Cart();
                    cart.setCartItemId(rs.getInt("cart_item_id"));
                    cart.setProductId(rs.getInt("product_id"));
                    cart.setCartId(rs.getInt("cart_id"));
                    cart.setQuantity(rs.getInt("quantity"));
                    list.add(cart);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
