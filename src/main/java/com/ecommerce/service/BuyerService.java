package com.ecommerce.service;

import java.util.List;

import com.ecommerce.dao.BuyerDAOInterface;
import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.utility.EcommerceDAOFactory;

public class BuyerService implements BuyerServiceInterface {

	private BuyerDAOInterface buyerDAO;

	public BuyerService() {
		this.buyerDAO = EcommerceDAOFactory.createBuyerDAO("buyer");
	}

	@Override
	public List<Product> viewAllProducts() {
		return buyerDAO.viewAllProductsDAO();
	}

	@Override
	public Product viewProductDetails(String productId) {
		return buyerDAO.viewProductDetailsDAO(productId);
	}

	@Override
	public List<Product> browseProductsByCategory(String category) {
		return buyerDAO.browseProductsByCategoryDAO(category);
	}

	@Override
	public boolean rateAndReviewProducts(String productId, int rating, String review) {
		return buyerDAO.rateAndReviewProductsDAO(productId, rating, review);
	}

	@Override
	public boolean addProductToCart(String email, String productId, int quantity) {
		return buyerDAO.addProductToCartDAO(email, productId, quantity);
	}

	@Override
	public boolean removeProductFromCart(String email, String productId, int cartId) {
		return buyerDAO.removeProductFromCartDAO(email, productId, cartId);
	}

	@Override
	public Order createOrder(String email, String productId, int quantity) {
		return buyerDAO.createOrderDAO(email, productId, quantity);
	}

	@Override
	public List<Order> viewOrders(String email) {
		return buyerDAO.viewOrdersDAO(email);
	}

	@Override
	public List<Cart> viewCart(String email) {
		return buyerDAO.viewCartDAO(email);
	}

}
