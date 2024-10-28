package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;

public interface BuyerServiceInterface {

	List<Product> viewAllProducts();

	Product viewProductDetails(String productId);

	List<Product> browseProductsByCategory(String category);

	boolean rateAndReviewProducts(String productId, int rating, String review);

	List<Cart> viewCart(String email);

	boolean addProductToCart(String email, String productId, int quantity);

	boolean removeProductFromCart(String email, String productId, int cartId);

	Order createOrder(String email, String productId, int quantity);

	List<Order> viewOrders(String email);
}
