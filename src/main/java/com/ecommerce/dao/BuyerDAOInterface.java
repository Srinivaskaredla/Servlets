package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;

public interface BuyerDAOInterface {

	List<Product> viewAllProductsDAO();

	Product viewProductDetailsDAO(String productId);

	List<Product> browseProductsByCategoryDAO(String category);

	boolean rateAndReviewProductsDAO(String productId, int rating, String review);

	boolean addProductToCartDAO(String email, String productId, int quantity);

	boolean removeProductFromCartDAO(String email, String productId, int cartId);

	Order createOrderDAO(String email, String productId, int quantity);

	List<Cart> viewCartDAO(String email);

	List<Order> viewOrdersDAO(String email);
}
