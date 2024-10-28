package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.utility.DatabaseConnection;

public class BuyerDAO implements BuyerDAOInterface {

	@Override
	public List<Product> viewAllProductsDAO() {
		List<Product> products = new ArrayList<>();
		String query = "SELECT * FROM Product";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getString("productId"));
				product.setProductName(rs.getString("productName"));
				product.setPrice(rs.getDouble("price"));
				product.setCategory(rs.getString("category"));
				product.setImagePath(rs.getString("imagePath"));
				products.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	@Override
	public List<Product> browseProductsByCategoryDAO(String category) {
		List<Product> products = new ArrayList<>();
		String query = "SELECT * FROM Product WHERE category LIKE ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			String searchKeyword = "%" + category + "%";
			pstmt.setString(1, searchKeyword);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					Product product = new Product();
					product.setProductId(rs.getString("productId"));
					product.setProductName(rs.getString("productName"));
					product.setDescription(rs.getString("description"));
					product.setPrice(rs.getDouble("price"));
					product.setStockQuantity(rs.getInt("stockQuantity"));
					product.setCategory(rs.getString("category"));
					product.setImagePath(rs.getString("imagePath"));
					products.add(product);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	@Override
	public Product viewProductDetailsDAO(String productId) {
		Product product = null;
		String query = "SELECT * FROM Product WHERE productId = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, productId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					product = new Product();
					product.setProductId(rs.getString("productId"));
					product.setProductName(rs.getString("productName"));
					product.setDescription(rs.getString("description"));
					product.setPrice(rs.getDouble("price"));
					product.setStockQuantity(rs.getInt("stockQuantity"));
					product.setCategory(rs.getString("category"));
					product.setImagePath(rs.getString("imagePath"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return product;
	}

	@Override
	public boolean rateAndReviewProductsDAO(String productId, int rating, String review) {
		boolean success = false;
		String query = "INSERT INTO RateReview (productId, rating, reviewText) VALUES (?, ?, ?)";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, productId);
			pstmt.setInt(2, rating);
			pstmt.setString(3, review);

			int rowsAffected = pstmt.executeUpdate();
			if (rowsAffected > 0) {
				success = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}

	@Override
	public boolean addProductToCartDAO(String email, String productId, int quantity) {
		boolean success = false;
		String checkQuery = "SELECT quantity FROM Cart WHERE email = ? AND productId = ?";
		String updateQuery = "UPDATE Cart SET quantity = quantity + ? WHERE email = ? AND productId = ?";
		String insertQuery = "INSERT INTO Cart (email, productId, quantity, price, imagePath) VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = DatabaseConnection.getConnection()) {
			PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
			checkStmt.setString(1, email);
			checkStmt.setString(2, productId);
			ResultSet rs = checkStmt.executeQuery();

			if (rs.next()) {
				PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
				updateStmt.setInt(1, quantity);
				updateStmt.setString(2, email);
				updateStmt.setString(3, productId);
				int rowsAffected = updateStmt.executeUpdate();
				success = (rowsAffected > 0);
			} else {
				Product product = viewProductDetailsDAO(productId);
				if (product != null) {
					PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
					insertStmt.setString(1, email);
					insertStmt.setString(2, productId);
					insertStmt.setInt(3, quantity);
					insertStmt.setDouble(4, product.getPrice());
					insertStmt.setString(5, product.getImagePath());
					int rowsAffected = insertStmt.executeUpdate();
					success = (rowsAffected > 0);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}

	@Override
	public boolean removeProductFromCartDAO(String email, String productId, int cartId) {
		String query = "DELETE FROM Cart WHERE email = ? AND productId = ? AND cartID=?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, email);
			pstmt.setString(2, productId);
			pstmt.setInt(3, cartId);

			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Order createOrderDAO(String email, String productId, int quantity) {
	    Order order = null;
	    String cartQuery = "SELECT price, quantity FROM Cart WHERE email = ? AND productId = ?";
	    String orderInsertQuery = "INSERT INTO `Order` (email, orderDate, totalAmount, status, productId, quantity, price) VALUES (?, CURRENT_TIMESTAMP, ?, 'Pending', ?, ?, ?)";
	    String clearCartQuery = "DELETE FROM Cart WHERE email = ? AND productId = ?";

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement cartStmt = conn.prepareStatement(cartQuery);
	         PreparedStatement orderInsertStmt = conn.prepareStatement(orderInsertQuery, Statement.RETURN_GENERATED_KEYS);
	         PreparedStatement clearCartStmt = conn.prepareStatement(clearCartQuery)) {

	        conn.setAutoCommit(false); 

	        cartStmt.setString(1, email);
	        cartStmt.setString(2, productId);
	        try (ResultSet rs = cartStmt.executeQuery()) {
	            if (rs.next()) {
	                double price = rs.getDouble("price");
	                int cartQuantity = rs.getInt("quantity");

	                if (quantity > cartQuantity) {
	                    throw new IllegalArgumentException("Requested quantity exceeds the quantity in the cart.");
	                }

	                double totalAmount = quantity * price;

	                orderInsertStmt.setString(1, email);
	                orderInsertStmt.setDouble(2, totalAmount);
	                orderInsertStmt.setString(3, productId);
	                orderInsertStmt.setInt(4, quantity);
	                orderInsertStmt.setDouble(5, price);
	                orderInsertStmt.executeUpdate();

	                clearCartStmt.setString(1, email);
	                clearCartStmt.setString(2, productId);
	                clearCartStmt.executeUpdate();

	                try (ResultSet generatedKeys = orderInsertStmt.getGeneratedKeys()) {
	                    if (generatedKeys.next()) {
	                        int orderId = generatedKeys.getInt(1);

	                        order = new Order();
	                        order.setOrderId(orderId);
	                        order.setEmail(email);
	                        order.setOrderDate(java.time.LocalDateTime.now());
	                        order.setTotalAmount(totalAmount);
	                        order.setStatus("Pending");
	                        order.setProductId(productId);
	                        order.setQuantity(quantity);
	                        order.setPrice(price);

	                        conn.commit();
	                    }
	                }
	            } else {
	                throw new IllegalArgumentException("Product not found in cart.");
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return order;
	}


	@Override
	public List<Order> viewOrdersDAO(String email) {
		List<Order> orders = new ArrayList<>();
		String query = "SELECT * FROM `Order` WHERE email = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, email);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					Order order = new Order();
					order.setOrderId(rs.getInt("orderId"));
					order.setEmail(rs.getString("email"));
					order.setOrderDate(rs.getTimestamp("orderDate").toLocalDateTime());
					order.setTotalAmount(rs.getDouble("totalAmount"));
					order.setStatus(rs.getString("status"));
					order.setProductId(rs.getString("productId"));
					order.setPrice(rs.getInt("price"));
					order.setQuantity(rs.getInt("quantity"));
					orders.add(order);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return orders;
	}

	@Override
	public List<Cart> viewCartDAO(String email) {
		List<Cart> cartItems = new ArrayList<>();
		String query = "SELECT * FROM Cart WHERE email = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, email);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					Cart cart = new Cart();
					cart.setCartId(rs.getInt("cartId"));
					cart.setEmail(rs.getString("email"));
					cart.setProductId(rs.getString("productId"));
					cart.setQuantity(rs.getInt("quantity"));
					cart.setPrice(rs.getDouble("price"));
					cart.setImagePath(rs.getString("imagePath"));
					cartItems.add(cart);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cartItems;
	}
}
