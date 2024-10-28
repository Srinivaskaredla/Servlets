package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.entity.RateReview;
import com.ecommerce.utility.DatabaseConnection;

public class RetailerDAO implements RetailerDAOInterface {

	@Override
	public List<Product> manageInventoryAndProductDetailsDAO() {
		List<Product> products = new ArrayList<>();
		String query = "SELECT * FROM Product";

		try (Connection conn = DatabaseConnection.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query)) {

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

		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	@Override
	public int addProductsDAO(Product product) {
		String query = "INSERT INTO Product (productId, productName, description, price, stockQuantity, category, imagePath) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, product.getProductId());
			pstmt.setString(2, product.getProductName());
			pstmt.setString(3, product.getDescription());
			pstmt.setDouble(4, product.getPrice());
			pstmt.setInt(5, product.getStockQuantity());
			pstmt.setString(6, product.getCategory());
			pstmt.setString(7, product.getImagePath());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public Product getProductByIdDAO(String productId) {
		Product product = null;
		String query = "SELECT * FROM Product WHERE productId = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, productId);
			ResultSet rs = pstmt.executeQuery();

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

		} catch (Exception e) {
			e.printStackTrace();
		}

		return product;
	}

	@Override
	public boolean updateProductDAO(Product product) {
		String query = "UPDATE Product SET productName = ?, description = ?, price = ?, stockQuantity = ?, category = ?, imagePath = ? WHERE productId = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, product.getProductName());
			pstmt.setString(2, product.getDescription());
			pstmt.setDouble(3, product.getPrice());
			pstmt.setInt(4, product.getStockQuantity());
			pstmt.setString(5, product.getCategory());
			pstmt.setString(6, product.getImagePath());
			pstmt.setString(7, product.getProductId());

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean deleteProductDAO(String productId) {
		String query = "DELETE FROM Product WHERE productId = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, productId);

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<RateReview> productReviewSentByBuyerDAO() {
		List<RateReview> reviews = new ArrayList<>();
		String query = "SELECT * FROM RateReview";

		try (Connection conn = DatabaseConnection.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query)) {

			while (rs.next()) {
				RateReview review = new RateReview();
				review.setReviewId(rs.getString("reviewId"));
				review.setProductId(rs.getString("productId"));
				review.setRating(rs.getInt("rating"));
				review.setReviewText(rs.getString("reviewText"));

				reviews.add(review);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return reviews;
	}

	@Override
	public boolean deleteReviewDAO(String reviewId) {
		String query = "DELETE FROM RateReview WHERE reviewId = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setString(1, reviewId);

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean updateOrderStatusDAO(int orderId, String orderStatus) {
	    String query = "UPDATE e_commerce.Order SET status = ? WHERE orderId = ?";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(query)) {
	    	
	        pstmt.setString(1, orderStatus);
	        pstmt.setInt(2, orderId);
	        int rowsUpdated = pstmt.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public List<Order> buyerplacedOrdersDAO() {
	    List<Order> orders = new ArrayList<>();
	    String query = "SELECT * FROM e_commerce.Order";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(query);
	         ResultSet rs = pstmt.executeQuery()) {
	        while (rs.next()) {
	        	Order order = new Order();
				order.setOrderId(rs.getInt("orderId"));
				order.setEmail(rs.getString("email"));
				order.setOrderDate(rs.getTimestamp("orderDate").toLocalDateTime());
				order.setTotalAmount(rs.getDouble("totalAmount"));
				order.setStatus(rs.getString("status"));
				order.setProductId(rs.getString("productId"));
				order.setQuantity(rs.getInt("quantity"));
				order.setPrice(rs.getDouble("price"));
				orders.add(order);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return orders;
	}
}
